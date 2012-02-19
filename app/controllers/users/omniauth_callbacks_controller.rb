class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    auth_hash = request.env['omniauth.auth']
    email = auth_hash.info['email']
    Rails.logger.info auth_hash

    user = User.find_by_email(email)
    user ||= User.create!(email: email, name: auth_hash.info['name'])

    if user.persisted?
      sign_in_and_redirect user
    end
  end
end
