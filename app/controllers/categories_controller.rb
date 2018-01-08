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
    @category.parent_category = Category.find(params[:id]) unless params[:id].nil?
  end

  

end
