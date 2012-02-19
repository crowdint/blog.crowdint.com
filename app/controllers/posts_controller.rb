class PostsController < ApplicationController
  caches_page :index, :show
  cache_sweeper :post_sweeper

  def index
    @posts = Post.for_index
  end

  def show
    @post = Post.find_by_permalink(params[:id])
  end
end
