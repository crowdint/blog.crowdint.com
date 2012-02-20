class ArchiveController < ApplicationController
  def show
    @posts = Post.order('published_at DESC').where(state: 'published')
  end
end
