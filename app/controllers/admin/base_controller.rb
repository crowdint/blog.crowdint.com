class Admin::BaseController < ApplicationController
  layout 'admin'

  before_filter :authenticate!

  def authenticate!
    redirect_to user_omniauth_authorize_path :google_oauth2 unless current_user
  end
end
