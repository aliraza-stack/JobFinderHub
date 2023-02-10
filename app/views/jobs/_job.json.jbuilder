json.extract! job, :id, :title, :description, :required_skills, :location, :job_type, :salary, :application_deadline, :company, :contact, :user_id, :created_at, :updated_at
json.url job_url(job, format: :json)
