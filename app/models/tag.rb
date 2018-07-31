require 'elasticsearch/model'
class Tag < ApplicationRecord
  has_many :video_tag_mappings
  has_many :videos, through: :video_tag_mappings
  include Shared::Tokenable
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
