class Admin::BaseController < ApplicationController
  layout 'admin'

  before_filter :authenticate!

  def authenticate!
    redirect_to '/auth/google_oauth2' unless current_user
  end
end
