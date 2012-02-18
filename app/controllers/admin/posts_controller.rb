class Admin::PostsController < Admin::BaseController
  respond_to :html, :json

  def index
    respond_to do |format|
      format.json { render json: Post.all }
      format.html
    end
  end

  def create
    @post = Post.new(params[:post])
    @post.save
    respond_with [:admin, @post]
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_with @post
  end
end
