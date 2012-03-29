module Crowdblog::Devise

  module Sessions
    def destroy
      sign_out current_user
      redirect_to root_url
    end
  end

  module Auth
    def authenticate!
      redirect_to user_omniauth_authorize_path :google_apps unless current_user

      ## sign out the user if trying to sign another user
      #sign_out current_user if params['auth_token'] && current_user
      #
      ## if no one signed in, use the default user
      #unless user_signed_in?
      #  user = Crowdblog::User.find_by_email('foo@crowdint.com') || Crowdblog::User.create!(email: 'foo@crowdint.com', is_publisher: true)
      #  sign_in user
      #end
    end
  end

end
