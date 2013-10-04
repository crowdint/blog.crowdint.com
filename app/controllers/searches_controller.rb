class SearchesController < ApplicationController
  def index
    @query = params[:q]
    @posts = Post.query(@query).results
  end
end
