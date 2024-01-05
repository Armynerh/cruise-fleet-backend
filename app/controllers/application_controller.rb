class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :set_current_user

  before_action do
    ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
  end

  def set_current_user
    return unless session[:user_id]

    @current_user = User.find(session[:user_id])
  end
end
