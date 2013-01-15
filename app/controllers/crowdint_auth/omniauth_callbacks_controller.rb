class CrowdintAuth::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def user_class
    ::User
  end

  def create_user_record(email, name)
    user = user_class.new(:email => email, :name => name)
    user.password = Time.now.to_i
    user.password_confirmation = user.password
    user.save!
    user
  end

  def google_apps
    auth_hash = request.env['omniauth.auth']
    email = auth_hash.info['email']

    user = user_class.find_by_email(email)
    user ||= create_user_record(email, auth_hash.info['name'])

    if user.persisted?
      sign_in_and_redirect user
    end
  end

  def google_apps_sign_in
    redirect_to user_omniauth_authorize_path :google_apps
  end
end
