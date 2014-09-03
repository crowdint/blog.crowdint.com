class SessionsController < ApplicationController
  def create
    user = warden.authenticate!(scope: :user)
    redirect_to after_sign_in_path_for(user)
  end

  def destroy
    warden.logout(:user)
    redirect_to after_sign_out_path_for(nil)
  end
end

