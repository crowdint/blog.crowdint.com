class SearchesController < ApplicationController
  def index
    return redirect_to root_path unless params[:q].present?

    @query = params[:q]
    @posts = Post.query(@query).results
  end

  def search
    redirect_to "/search/#{params[:q]}"
  end
end
