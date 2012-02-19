class PostSweeper < ActionController::Caching::Sweeper
  observe Post

  def after_create(post)
    expire_all
  end

  def after_update(post)
    expire_all
  end

  def after_destroy(post)
    expire_all
  end

  private
  def expire_all
    expire_page(controller: 'posts', action: 'index')
    expire_page(controller: 'posts', action: 'show')
  end
end
