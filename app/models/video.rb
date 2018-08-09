require 'elasticsearch/model'
class Video < ApplicationRecord
  has_many :video_tag_mappings
  has_many :tags, through: :video_tag_mappings
  include ElasticSearchQueries
  include Elasticsearch::Model
  include  Elasticsearch::Model::Callbacks

  # TODO::y shit settings to module
  settings index: {
      number_of_shards: 1,
      number_of_replicas: 0,
      analysis: {
          analyzer: {
              my_analyzer: {
                  type: 'custom',
                  tokenizer: 'standard',
                  filter: %w(standard lowercase stemmer custom_stopwords custom_nGram)
              }
          },
          filter: {
              custom_stopwords: {
                  type: 'stop',
                  stopwords: SkippableWords::SKIP_TAGS
              },
              custom_nGram: {
                  type: 'ngram',
                  min_gram: 3,
                  max_gram: 3,
                  token_chars: %w(
                      letter
                      digit
                  )
              }
          }
      }
  } do
    mappings dynamic: 'false' do
      indexes :desc, type: 'text', analyzer: 'my_analyzer'
      indexes :name, type: 'text', analyzer: 'my_analyzer'
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
