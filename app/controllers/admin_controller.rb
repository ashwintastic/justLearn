class AdminController < ApplicationController


  def admin

  end

  def set_video_tags
    @videos = if params.include?(:q)
                Video.search_(params[:q])
              else
                Video.all_
              end
  end
end
