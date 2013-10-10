class Admin::DropboxSyncsController < Crowdblog::ApplicationController
  def new
    #current_user.user_dropbox_session.sync
    redirect_to crowdblog.posts_path
  end
end
