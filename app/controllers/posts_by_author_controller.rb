class PostsByAuthorController < ApplicationController
  respond_to :html

  def index
    @author = User.find(params[:id])
    raise ActionController::RoutingError.new('Author Not Found') unless @author
    @posts = Post.by_author(@author.id)
    @history = Post.for_history
    respond_with @posts
  end
end
