class SearchesController < ApplicationController
  def index
    @posts = Post.query(params).results
  end
end
