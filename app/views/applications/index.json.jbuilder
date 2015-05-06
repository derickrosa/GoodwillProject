json.array!(@applications) do |application|
  json.extract! application, :id, :applicant_id, :title, :description, :category_id, :request_date, :status, :volunteers_number
  json.url application_url(application, format: :json)
end
