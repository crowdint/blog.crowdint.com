class SessionsController < ApplicationController
  def authenticate_user
    auth_hash = request.env['omniauth.auth']

    #session[:user] = auth_hash['user_info']['email']

    if allowed?
      redirect_to '/'
    else
      render :text => '401 Unauthorized', :status => 401
    end
  end
end