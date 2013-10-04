class Crowdblog::PostsController < ApplicationController

  def index
    @posts = ::Post.for_index.paginate(:page => params[:page], :per_page => 5)
    @history = ::Post.for_history - @posts
  end

  def show
    @post = Crowdblog::Post.find_by_permalink(params[:id])
    unless @post
      @post = Crowdblog::Post.find(params[:id])
      @post.published_at = Date.today
    end
    @history = Crowdblog::Post.for_history - [@post]
  end

end
