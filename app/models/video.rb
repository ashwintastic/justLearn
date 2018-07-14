class Video < ApplicationRecord
  has_many :video_tag_mappings
  has_many :tags, through: :video_tag_mappings
  include Shared::Tokenable
  class << self

   
    def search_videos(search_param)
      tag_query = Tag.where('name like (:tag_query)', tag_query: "%#{search_param}%").map(&:id)
      vide_tag_query = VideoTagMapping.where(tag_id: tag_query).map(&:video_id).uniq

      result =	where('name like (:query)', query: "%#{search_param}%").or(where(id: vide_tag_query ))

    end
  end
end
