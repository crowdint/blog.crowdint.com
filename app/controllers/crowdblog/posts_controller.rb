class Crowdblog::PostsController < ApplicationController
  before_action :get_categories, only: [:index, :show]
  def index
    @recent_post = ::Post.last_published(1).first
    @posts = ::Post.for_index.paginate(:page => params[:page], :per_page => 4).where.not(id: @recent_post)
    @history = ::Post.for_history - @posts
  end

  def show
    @post = ::Post.find_by_permalink(params[:id])
    unless @post
      @post = ::Post.find(params[:id])
      @post.published_at = Date.today
    end

    # Ugly hack to set meta tags once we get the @post
    set_meta
    #######

    @post_by_author = ::Post.where(state: 'published').where('id <> ?', @post).where(author_id: @post.author).order('published_at DESC, id DESC').limit(3)

    @history = ::Post.for_history - [@post]
  end

  private

  def get_categories
    @categories = Category.with_posts
  end
end
