json.extract! video, :id, :token, :name, :path, :created_at, :updated_at
json.url video_url(video, format: :json)
