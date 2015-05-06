json.array!(@posts) do |post|
  json.extract! post, :id, :applicant_id, :title, :description, :category_id
  json.url post_url(post, format: :json)
end
