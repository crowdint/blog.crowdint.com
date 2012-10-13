class PostObserver < ActiveRecord::Observer
  observe 'Crowdblog::Post'

  def after_save(post)
    Crowdblog::User.publishers.each do |u|
      user_dropbox_session = UserDropboxSession.find_by_user_id(u.id)
      if user_dropbox_session
        session = user_dropbox_session.dropbox_session
        client = DropboxClient.new session, UserDropboxSession::ACCESS_TYPE
        file = StringIO.new post.body
        client.put_file "#{post.id}-#{post.permalink}.md", file, 'True'
      end
    end
  end
end
