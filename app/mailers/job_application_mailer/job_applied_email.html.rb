class JobApplicationMailer < ApplicationMailer

  def job_applied_email
    @job_application = params[:job_application]

    mail(to: @job_application.email, subject: "You applied for a job #{@job_application.job.title} at #{@job_application.job.company.name}")
    mail(to: @job_application.job.company.email, subject: "You got a new application for a job #{@job_application.job.title}")
  end

end
