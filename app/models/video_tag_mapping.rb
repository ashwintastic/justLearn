require 'elasticsearch/model'
class VideoTagMapping < ApplicationRecord
  belongs_to :video
  belongs_to :tag
  validates :video, uniqueness: { scope: :tag }
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
#VideoTagMapping.import