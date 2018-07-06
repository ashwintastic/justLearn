class Tag < ApplicationRecord
  has_many :video_tag_mappings
  has_many :videos, through: :video_tag_mappings
end
