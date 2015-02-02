class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @posts = @category.published_posts.
      paginate(page: params[:page], per_page: 4)
  end
end
