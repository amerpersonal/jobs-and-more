class JobsController < ApplicationController
  before_action :set_job, only: %i[ destroy ]
  before_action :authenticate_user!, only: %i[ new create ]

  # GET /jobs or /jobs.json
  def index
    @jobs = BrowseJobsQuery.new().browse_jobs(params)
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # POST /jobs or /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        redirect_to jobs_path, notice: "Job was successfully created."
      else
        render json: @job.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /jobs/1 or /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: "Job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:title, :description, :start_date, :end_date, :category_id, :company_id)
    end
end
