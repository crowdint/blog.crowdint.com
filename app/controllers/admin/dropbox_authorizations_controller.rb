require 'dropbox_sdk'

class Admin::DropboxAuthorizationsController < Crowdblog::ApplicationController
  def show
    if params[:uid]
      user_dropbox_session = UserDropboxSession.find_by_user_id current_user.id
      dropbox_session = user_dropbox_session.dropbox_session
      dropbox_session.get_access_token
      user_dropbox_session.dropbox_session = dropbox_session
      user_dropbox_session.save!
    end
  end

  def new
    dropbox_session = DropboxSession.new 'm0dnxdigrulrnle', 'nlzaj1p1vor7qn0'
    user_dropbox_session = UserDropboxSession.find_or_create_by_user_id current_user.id
    user_dropbox_session.update_attribute :dropbox_session, dropbox_session
    Rails.logger.info redirect_url = dropbox_session.get_authorize_url(admin_dropbox_authorization_url)
    user_dropbox_session.dropbox_session = dropbox_session
    user_dropbox_session.save!

    redirect_to redirect_url
  end

  def create

  end
end
