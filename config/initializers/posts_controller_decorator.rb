Crowdblog::Admin::PostsController.class_eval do
  def edit
    @categories = Category.all
  end

  def update
    @post.update_attributes(post_params)
    @post.categories = Category.find params[:post][:categories_ids]
    if @post.allowed_to_update_permalink?
      @post.regenerate_permalink
      @post.save!
    end

    respond_with @post do |format|
      format.html { redirect_to crowdblog.admin_posts_path }
    end
  end

  private
  def load_post
    @post = ::Post.scoped_for(current_user).find(params[:id])
  end
end

