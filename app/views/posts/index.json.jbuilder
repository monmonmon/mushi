json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :bug_id, :comment, :rating
  json.url post_url(post, format: :json)
end
