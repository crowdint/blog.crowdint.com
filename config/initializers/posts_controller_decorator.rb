Crowdblog::Admin::PostsController.class_eval do
  before_action :load_categories, only: [:edit]

  def index
    @state = params[:state]
    @posts = Post.scoped_for(current_user).for_admin_index
    @posts = @state ? @posts.with_state(@state) : @posts.where(published_at: nil)
    respond_with @posts
  end

  def update
    @post.update_attributes(post_params)
    @post.categories = Category.where(id: params[:post][:categories_ids])
    if @post.allowed_to_update_permalink?
      @post.regenerate_permalink
      @post.save!
    end

    respond_with @post do |format|
      format.html { redirect_to crowdblog.admin_posts_path }
    end
  end

  private

  def load_categories
    @categories = Category.all
  end
end

