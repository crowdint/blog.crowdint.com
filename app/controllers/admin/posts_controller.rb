class Admin::PostsController < Admin::BaseController
  respond_to :html, :json

  def index
    respond_to do |format|
      format.json { render json: Post.all_posts_json }
      format.html
    end
  end

  def create
    @post = Post.new(params[:post])
    @post.author = current_user
    @post.published = false
    @post.regenerate_permalink
    @post.save
    respond_with [:admin, @post]
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_with @post
  end

  def show
    @post = Post.find(params[:id])
    respond_with @post
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    if @post.allowed_to_update_permalink?
      @post.regenerate_permalink
      @post.save
    end

    respond_with @post
  end
end
