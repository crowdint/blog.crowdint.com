module Crowdblog
  module Admin
    class PostsController < Crowdblog::Admin::BaseController
      respond_to :html, :json

      before_filter :load_post, :only => [ :edit, :update, :destroy ]

      def new
        @post = Post.new
        @post.state = :drafted
        @post.author = current_user
        @post.save!
        redirect_to edit_admin_post_path(@post)
      end

      def index
        @state = params[:state]
        @posts = Post.scoped_for(current_user).for_admin_index
        @posts = @posts.with_state(@state) if @state
        respond_with @posts
      end

      def create
        @post = Post.new(post_params)
        @post.author = current_user
        @post.regenerate_permalink
        if @post.save
          respond_with @post, :location => crowdblog.admin_posts_path
        end
      end

      def destroy
        @post.destroy
        respond_with @post, :location => crowdblog.admin_posts_path
      end

      def show
        @post = Post.includes(:assets).find(params[:id])
        respond_to do |format|
          format.json { render json: @post.to_json(include: :assets) }
        end
      end

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

      def post_params
        params.require(:post).permit(:title, :body, :updated_by, :ready_for_review, :transition)
      end
    end
  end
end
