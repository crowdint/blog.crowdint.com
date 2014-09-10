class PreviewsController < ApplicationController
  def show
    @post = Post.includes(:author).find(params[:id])
    @post.published_at = Date.today

    @post_by_author = Crowdblog::Post.where(state: 'published').where('id <> ?', @post).where(author_id: @post.author).order('published_at DESC, id DESC').limit(3)
    render 'crowdblog/posts/show'
  end
end
