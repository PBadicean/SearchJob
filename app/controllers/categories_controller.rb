class CategoriesController < ApplicationController
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
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to @category
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
