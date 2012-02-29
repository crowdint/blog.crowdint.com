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

  def author
    @author = User.where(['email like ?', params[:author] + '@%']).first
    raise ActionController::RoutingError.new('Author Not Found') unless @author
    @posts = Post.by_author(@author.id)
  end
end
