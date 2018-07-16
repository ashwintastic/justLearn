class Video < ApplicationRecord
  has_many :video_tag_mappings
  has_many :tags, through: :video_tag_mappings
  include Shared::Tokenable
  class << self

   
   def search_tags(keywords_to_search)
    tag_to_search = keywords_to_search.map {|val| "%#{val}%" }
    debugger
    Tag.where('name ilike  any (array[?])', tag_to_search).map(&:id)
   end

   def search_video_in_tag_mapping(tag_query)
    VideoTagMapping.where(tag_id: tag_query).map(&:video_id).uniq
   end

   def is_related_param(search_param)
     keyword =  Keyword.find_by_name(search_param)
     !!(keyword.and_related)
   end

    def search_videos(search_param)
      keywords_to_search = slice_tag(search_param)
      tags = search_tags(keywords_to_search)
      video_tags = search_video_in_tag_mapping(tags) 
      result =	where('name like (:query)', query: "%#{search_param}%").or(where(id: video_tags ))
    end


      def slice_tag(search_param)
        tags_in_params = search_param.split(' ')
        tags_in_params - SkippableWords::SKIP_TAGS
      end
  end
end
