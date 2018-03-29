class ApplicationController < ActionController::API
  before_action :authenticate_request
  rescue_from ActionController::ParameterMissing, with: :missing_required_parameter

  def not_found_error(record_type)
    "Sorry, we could not find that #{record_type}."
  end

  def validation_errors(record)
    {errors: record.errors.messages&.values&.flatten}
  end

  private

  def authenticate_request
    auth_token = request.headers["Authorization"]
    unless auth_token == 'turnsignal'
      render json: {errors: ["Incorrect auth token"]}, status: 401
      return
    end
  end

  def missing_required_parameter(exception)
    render json: {errors: ["Please nest the object parameters under the object name: #{exception.message}"]}
  end
end
