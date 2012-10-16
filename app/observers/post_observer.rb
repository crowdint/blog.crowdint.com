class PostObserver < ActiveRecord::Observer
  observe 'Crowdblog::Post'

  def after_save(post)
    if post.changes.keys.include?("body")
      User.publishers.includes(:user_dropbox_session).each do |u|
        user_dropbox_session = u.user_dropbox_session
        user_dropbox_session.put_post(post) if user_dropbox_session
      end
    end
  end
end
