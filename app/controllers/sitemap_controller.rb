class SitemapController < ApplicationController
  respond_to :xml

  def show
    @posts = Post.published_and_ordered
    @authors = User.published_authors
    respond_with @posts
  end
end
