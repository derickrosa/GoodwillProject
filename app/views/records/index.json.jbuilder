json.array!(@records) do |record|
  json.extract! record, :id, :resquest_id, :applicant_id, :volunteer_id, :status
  json.url record_url(record, format: :json)
end
