class PostSweeper < ActionController::Caching::Sweeper
  observe Post

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
    expire_page(controller: '/posts', action: 'index')
    expire_page(controller: '/posts', action: 'show',
                year: post.year, month: post.month, day: post.day, id: post.permalink, format: 'html')
  end
end
