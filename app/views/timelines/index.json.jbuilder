json.array!(@timelines) do |timeline|
  json.extract! timeline, :id, :user_id, :request_id
  json.url timeline_url(timeline, format: :json)
end
