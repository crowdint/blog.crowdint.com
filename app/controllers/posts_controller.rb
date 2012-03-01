class PostsController < ApplicationController
  caches_page :index, :show

  def index
    @posts = Post.for_index
    @history = Post.for_history - Post.for_index
  end

  def show
    @post = Post.find_by_permalink(params[:id])
    unless @post
      @post = Post.find(params[:id])
      @post.published_at = Date.today
    end
    @history = Post.for_history - [@post]
  end

end
