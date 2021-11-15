require_relative '../../api/api_controller'

class Api::V1::JobsController < Api::ApiController

  def index
    render json: BrowseJobsQuery.new().browse_jobs(params)
  end
end
