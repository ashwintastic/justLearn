require 'elasticsearch/model'
class Video < ApplicationRecord
  has_many :video_tag_mappings
  has_many :tags, through: :video_tag_mappings
 # include Shared::Tokenable
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings index: {
      number_of_shards: 1,
      number_of_replicas: 0,
      analysis: {
          analyzer: {
              my_analyzer: {
                  type: 'custom',
                  tokenizer: 'standard',
                  filter: ['standard', 'lowercase', 'stemmer']
              }
          }
      }
  } do
    mappings dynamic: 'false' do
      indexes :name, type: 'string', analyzer: 'my_analyzer'
      indexes :desc, type: 'string', analyzer: 'my_analyzer'
    end
  end



=begin

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name, type: 'string', analyzer: 'english'
      indexes :desc, type: 'string', analyzer: 'english'
    end
  end
=end

  class << self
    def search(query)
      __elasticsearch__.search(
          {
              query: {
                  multi_match: {
                      query: query,
                      fields: %w(name desc)
                  }
              },
              highlight: {
                  pre_tags: ['<em>'],
                  post_tags: ['</em>'],
                  fields: {
                      title: {},
                      text: {}
                  }
              }
          }
      )
    end
  end
end
Video.__elasticsearch__.client.indices.delete index: Video.index_name rescue nil

# Create the new index with the new mapping
Video.__elasticsearch__.client.indices.create \
  index: Video.index_name,
  body: { settings: Video.settings.to_hash, mappings: Video.mappings.to_hash }

# Index all Video records from the DB to Elasticsearch
Video.import
