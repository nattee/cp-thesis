json.extract! user, :id, :login, :name, :email, :role, :last_login, :created_at, :updated_at
json.url user_url(user, format: :json)
