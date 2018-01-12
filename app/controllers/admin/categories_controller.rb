class Admin::CategoriesController < Admin::BaseController

  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @category = nil
    @categories = Category.where(parent_id: nil)
  end

  def show
    @category = Category.find(params[:id])
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

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to admin_category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end

  def set_category
    @category = Category.find(params[:id])
  end

end
