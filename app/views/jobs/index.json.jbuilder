json.array!(@jobs) do |job|
  json.extract! job, :id, :title, :description, :application_deadline, :category_id, :tags_id, :employers_id
  json.url job_url(job, format: :json)
end
