class ApplicationController < ActionController::Base
  protect_from_forgery

  def allowed?
    return true
  end

  def user_required
    redirect_to '/auth/google_oauth2' unless allowed?
  end
end
