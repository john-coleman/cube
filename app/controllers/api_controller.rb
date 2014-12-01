class ApiController < ActionController::Base
  before_action :check_api_key
  respond_to :json

  def check_api_key
    render json: {}, status: :unauthorized unless request.headers['X-Auth-Token'] == CONFIG['cube']['api_key']
  end
end
