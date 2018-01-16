class Admin::CategoriesController < Admin::BaseController

  before_action :set_category, only: [:edit, :update, :destroy, :show]

  def index
    @category = nil
    @categories = Category.only_parents
  end

  def show
    @categories = @category.subcategories
    render :index
  end

  def new
    @category = Category.new
    @category.parent_id = Category.find(params[:id]).try(:id) unless params[:id].nil?
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end

  def set_category
    @category = Category.find(params[:id])
  end

end
