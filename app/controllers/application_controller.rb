class ApplicationController < ActionController::Base
  include JsonWebToken

  before_action :authenticate_request

  private

  def authenticate_request
    p("This is the debug message")

    header = request.headers['Authentication']
    header = header.split(' ').last if header
    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  end
end
