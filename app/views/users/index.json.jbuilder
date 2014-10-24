json.array!(@users) do |user|
  json.extract! user, :id, :username, :display_name, :email
  json.url user_url(user, format: :json)
end
