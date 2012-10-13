class UserDropboxSession < ActiveRecord::Base
  ACCESS_TYPE = :app_folder

  attr_accessible :dropbox_session, :user_id

  serialize :dropbox_session
end
