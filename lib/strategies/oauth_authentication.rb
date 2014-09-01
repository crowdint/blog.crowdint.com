module Strategies
  class OauthAuthentication < ::Warden::Strategies::Base
    def valid?
      request.env['omniauth.auth'].present?
    end

    def authenticate!
      auth = request.env['omniauth.auth']

      if authorized_domain?(auth)
        user = User.find_identity(auth['uid'], auth['provider'], auth['info']['email']) || create_user(auth)

        update_user(user, auth['uid'], auth['provider'])
        return success! user
      end

      fail! I18n.t('sessions.create.unauthorized_domain')
    end

  private
    def authorized_domain?(auth)
      if Rails.application.config.respond_to?(:authentication_domain) && Rails.application.config.authentication_domain.present?
        return auth['info']['email'].split('@').last == Rails.application.config.authentication_domain
      end

      true
    end

    def update_user(user, uid, provider)
      user.last_sign_in_ip = user.current_sign_in_ip
      user.current_sign_in_ip = request.ip
      user.last_sign_in_at = user.current_sign_in_at
      user.current_sign_in_at = DateTime.now
      user.sign_in_count = (user.sign_in_count || 0) + 1
      user.uid = uid unless user.uid
      user.provider = provider unless user.provider

      user.save
    end

    def create_user(auth)
      params = { uid: auth['uid'], provider: auth['provider'],
                name: auth['info']['name'], email: auth['info']['email'] }

      User.create! params
    end
  end
end

Warden::Strategies.add(:oauth_authentication, Strategies::OauthAuthentication)
