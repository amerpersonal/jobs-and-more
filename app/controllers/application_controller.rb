class ApplicationController < ActionController::Base
  before_action :set_current_params

  private
  def set_current_params
    @current_params = {}

    watch_for = [:term, :category]

    watch_for.each do |name|
      @current_params[name] = params[name] if params[name]
    end

  end
end
