json.array!(@job_applications) do |job_application|
  json.extract! job_application, :id, :job_id, :job_seeker_id, :status, :cover_letter, :application_deadline
  json.url job_application_url(job_application, format: :json)
end
