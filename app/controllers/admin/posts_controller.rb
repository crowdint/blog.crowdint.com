class Admin::PostsController < Admin::BaseController
  respond_to :html, :json
  cache_sweeper :post_sweeper

  def index
    @posts = Post.scoped_for(current_user).all_posts_json
    respond_to do |format|
      format.json { render json: @posts }
      format.html
    end
  end

  def create
    @post = Post.new(params[:post])
    @post.author = current_user
    @post.regenerate_permalink
    @post.save
    respond_with [:admin, @post]
  end

  def destroy
    @post = Post.scoped_for(current_user).find(params[:id])
    @post.destroy
    respond_with @post
  end

  def show
    @post = Post.includes(:assets).find(params[:id])
    respond_to do |format|
      format.json { render json: @post.to_json(include: :assets) }
    end
  end

  def update
    @post = Post.scoped_for(current_user).find(params[:id])
    @post.update_attributes(params[:post], updated_by: current_user)
    if @post.allowed_to_update_permalink?
      @post.regenerate_permalink
      @post.save!
    end

    @post.publish_if_allowed(params[:transition], current_user) if params[:transition]

    respond_with @post
  end
end
