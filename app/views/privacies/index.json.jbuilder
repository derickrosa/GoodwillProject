json.array!(@privacies) do |privacy|
  json.extract! privacy, :id, :request_id, :group_id
  json.url privacy_url(privacy, format: :json)
end
