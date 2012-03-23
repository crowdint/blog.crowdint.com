class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    crowdblog_url
  end

  def after_sign_out_path_for(resource)
    root_url
  end
end
