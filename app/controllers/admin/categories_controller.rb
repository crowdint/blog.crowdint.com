class Admin::CategoriesController < Crowdblog::Admin::BaseController
  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to main_app.admin_categories_path
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to main_app.admin_categories_path
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
