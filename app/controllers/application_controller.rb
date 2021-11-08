class ApplicationController < ActionController::Base
  # GET /jobs/:job_id/applications/new
  def new
    @application = Application.new(job: Jobs.find(params[:job_id]))
  end
end
