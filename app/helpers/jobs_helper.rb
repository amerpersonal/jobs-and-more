module JobsHelper
  def categories
    Category.all
  end

  def companies
    Company.all
  end

  def categories_for_select
    categories.map { |c| [c.title, c.id] }
  end

  def companies_for_select
    companies.map { |c| [c.name, c.id] }
  end

  def progress_tooltip_text(job)
    if job.expired?
      "Job posting expired " + pluralize(job.expired_ago, "day") + "  ago"
    else
      "Job posting opened " + pluralize(job.started_before, "day") + " ago, expires in " + pluralize(job.expires_in, "day")
    end
  end
end
