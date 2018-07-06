# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#IMAGE_HOST_URL

def save_video_name_in_db(video_tag, video_name)
  ActiveRecord::Base.transaction do
   video = Video.create(name: video_name,
                 token: SecureRandom.random_number.to_s.slice(2, 17)

    )

   tag = Tag.create(name: video_tag)
   video.tags << tag
  end

end


def list_videos (dir)
  p "inside #{dir}"
  scan_dir(dir) { |file| save_video_name_in_db(dir, file)}
  #save_video_name_in_db(dir, @file)
end

def scan_dir(dir, &block)
  Dir.chdir(dir) do
    Dir.glob('*').select do |f|
     block.call(f)
    end
  end
end


scan_dir(ENV['VIDEO_DIR']) { |file| list_videos(file) if File.directory? file }




