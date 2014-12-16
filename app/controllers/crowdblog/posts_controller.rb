class Crowdblog::PostsController < ApplicationController

  def index
    @posts = ::Post.for_index.paginate(:page => params[:page], :per_page => 5)
    @history = ::Post.for_history - @posts
    @tags = Tag.all
  end

  def show
    @post = Crowdblog::Post.find_by_permalink(params[:id])
    unless @post
      @post = Crowdblog::Post.find(params[:id])
      @post.published_at = Date.today
    end

    # Ugly hack to set meta tags once we get the @post
    set_meta
    #######

    @post_by_author = Crowdblog::Post.where(state: 'published').where('id <> ?', @post).where(author_id: @post.author).order('published_at DESC, id DESC').limit(3)

    @history = Crowdblog::Post.for_history - [@post]
  end
end
