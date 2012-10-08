class PostSweeper < ActionController::Caching::Sweeper
  observe Crowdblog::Post

  def after_create(post)
    expire_all(post)
  end

  def after_update(post)
    expire_all(post)
  end

  def after_destroy(post)
    expire_all(post)
  end

  private
  def expire_all(post)
    if post.published?
      expire_action main_app.post_url(*post.url_params)
    end
    expire_action main_app.atom_feed_url(:format => 'xml')
    expire_action main_app.archive_url
    expire_action main_app.root_url
    expire_action main_app.preview_url(post.to_param)
  end
end
