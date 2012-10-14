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
    # Not sure whats happening here with the engine routes
    if post.published?
      if main_app
        expire_action main_app.post_url(*post.url_params)
      else
        expire_action post_url(*post.url_params)
      end
    end
    if main_app
      expire_action main_app.atom_feed_url(:format => 'xml')
      expire_action main_app.archive_url
      expire_action main_app.root_url
      expire_action main_app.preview_url(post.to_param)
    else
      expire_action atom_feed_url(:format => 'xml')
      expire_action archive_url
      expire_action root_url
      expire_action preview_url(post.to_param)
    end
  end
end
