class PostsByAuthorController < ApplicationController
  respond_to :html
  
  def index
    @author = User.where(['email like ?', params[:author] + '@%']).first
    raise ActionController::RoutingError.new('Author Not Found') unless @author
    @posts = Post.by_author(@author.id)
    respond_with @posts
  end
end