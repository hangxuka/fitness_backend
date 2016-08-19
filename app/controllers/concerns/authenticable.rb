module Authenticable

  def current_user
    authentication_token = params[:auth_token] || request.env["HTTP_AUTH_TOKEN"]
    @current_user ||= Manager.find_by(auth_token: authentication_token)
  end
end
