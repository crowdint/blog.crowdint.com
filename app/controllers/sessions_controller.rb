class SessionsController < ApplicationController
  def authenticate_user
    auth_hash = request.env['omniauth.auth']

    if allowed?
      Rails.logger.info auth_hash.info
      email = auth_hash.info['email']
      user = User.find_by_email(email)
      user ||= User.create!(email: email, name: auth_hash.info['name'])
      sign_in user

      redirect_to '/admin'
    else
      render :text => '401 Unauthorized', :status => 401
    end
  end

  def allowed?
    true
  end
end
