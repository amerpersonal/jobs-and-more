class JobApplicationsController < ApplicationController
  before_action :set_job, only: %i[ new create index ]
  before_action :authenticate_user!, only: %i[ index ]

  # GET /jobs/:job_id/job_applications/new
  def new
    @job_application = @job.job_applications.build
  end

  def create
    @job_application = @job.job_applications.create(job_application_params)

    if @job_application.save
      flash[:notice] = "You successfully applied for a job #{@job_application.job.title} at #{@job_application.job.company.name}"

      JobApplicationMailer.job_applied_email(@job_application).deliver_now

      redirect_to jobs_path
    else
      render "new"
    end
  end

  def index
    @job_applications = @job.job_applications.sort_by { |job| job.id }.reverse #JobApplication.where(job_id: params[:job_id]).order("id desc")
  end

  private
  def job_application_params
    params.require(:job_application).permit(:first_name, :last_name, :email, :phone_number, :address, :birth_date, :competence)
  end

  def set_job
    @job = Job.find(params[:job_id])
  end

end
