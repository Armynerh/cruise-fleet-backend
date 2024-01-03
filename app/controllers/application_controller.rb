class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action do
    ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
  end
end
