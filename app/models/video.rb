class Video < ApplicationRecord
  has_many :video_tag_mappings
  has_many :tags, through: :video_tag_mappings
  include Shared::Tokenable
  class << self

   
   def search_tags(search_param)
    Tag.where('name like (:tag_query)', tag_query: "%#{search_param}%").map(&:id)
   end

   def search_video_in_tag_mapping(tag_query)
    VideoTagMapping.where(tag_id: tag_query).map(&:video_id).uniq
   end

   def is_related_param(search_param)
     keyword =  Keyword.find_by_name(search_param)
     !!(keyword.and_related)
   end

    def search_videos(search_param)
      if is_related_param(search_param)
      find_related_videos_as_well
    else
      tags_to_search = slice_tag(search_param)
      tags = search_tags(search_param)
      video_tags = search_video_in_tag_mapping(tags) 
      result =	where('name like (:query)', query: "%#{search_param}%").or(where(id: video_tags ))
     end
    end

    def find_related_videos_as_well
      []
    end

      def slice_tag(search_param)
        tags_in_params = search_param.split(' ')
        tags_in_params - SkippableWords::SKIP_TAGS
      end
  end
end
