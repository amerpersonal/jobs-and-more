class BrowseJobsQuery

  # we want to eagerly load category, company and all job applications to avoid executing dozens of queries when job.category or similar called inside view

  def load_jobs_eagerly
    Job.already_started.joins(:category).joins(:company).includes(:category, :company, :job_applications)
  end

  def initialize(jobs = load_jobs_eagerly)
    @jobs = jobs
  end

  def browse_jobs(params)
    if params[:category]
      @jobs = @jobs.by_category(params[:category])
    end

    if params[:term]
      @jobs = @jobs.for_term(params[:term])
    end

    @jobs.sorted_by_date.to_a
  end

end
