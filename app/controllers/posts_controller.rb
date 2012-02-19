class PostsController < ApplicationController
  def index
    @posts = Post.for_index
  end
end
