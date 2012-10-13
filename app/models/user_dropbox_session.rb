class UserDropboxSession < ActiveRecord::Base
  ACCESS_TYPE = :app_folder

  attr_accessible :dropbox_session, :user_id

  serialize :dropbox_session

  def put_post(post)
    client = DropboxClient.new dropbox_session, ACCESS_TYPE
    file = StringIO.new post.body
    client.put_file post.dropbox_name, file, 'True'
  end
end
