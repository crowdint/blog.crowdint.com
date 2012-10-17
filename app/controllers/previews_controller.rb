class PreviewsController < ApplicationController
  def show
    @post = Post.includes(:author).find(params[:id])
    @post.published_at = Date.today
    render 'crowdblog/posts/show'
  end
end
