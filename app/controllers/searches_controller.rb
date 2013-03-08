class SearchesController < ApplicationController
  def index
    return redirect_to root_path unless params[:q].present?

    @query = params[:q]
    @posts = Post.query(@query).results
  end
end
