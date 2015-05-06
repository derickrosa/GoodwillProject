json.array!(@requests) do |request|
  json.extract! request, :id, :applicant_id, :title, :description, :category_id, :request_date, :status, :volunteers_number
  json.url request_url(request, format: :json)
end
