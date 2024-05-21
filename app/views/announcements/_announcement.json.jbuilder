json.extract! announcement, :id, :title, :detail, :available, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
