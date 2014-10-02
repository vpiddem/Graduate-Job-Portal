json.array!(@job_seekers) do |job_seeker|
  json.extract! job_seeker, :id, :name_first, :name_last, :email, :password, :phone_number, :skills, :resume
  json.url job_seeker_url(job_seeker, format: :json)
end
