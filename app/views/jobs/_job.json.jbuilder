json.extract! job, :id, :title, :description, :start_date, :end_date, :category_id, :company_id, :created_at, :updated_at
json.url job_url(job, format: :json)
