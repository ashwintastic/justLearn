class Video < ApplicationRecord
  has_many :video_tag_mappings
  has_many :tags, through: :video_tag_mappings
end
