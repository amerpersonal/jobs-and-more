class JobApplicationMailer < ApplicationMailer

  def you_applied_for_job(job_application)

    @job_application = job_application

    mail(to: @job_application.email, subject: "You applied for a job #{@job_application.job.title} at #{@job_application.job.company.name}")
  end

  def someone_applied_for_job(job_application)

    @job_application = job_application

    mail(to: @job_application.job.company.email, subject: "Someone applied for a job #{@job_application.job.title}")
  end

end
