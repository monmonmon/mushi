json.array!(@bugs) do |bug|
  json.extract! bug, :id, :bug_id, :name, :keyname
  json.url bug_url(bug, format: :json)
end
