class VideoTagMapping < ApplicationRecord
  belongs_to :video
  belongs_to :tag
  validates :video, uniqueness: { scope: :tag }
end
