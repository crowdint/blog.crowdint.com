class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @posts = @category.published_posts
  end
end
