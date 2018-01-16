class CategoriesController < ApplicationController
  def index
    @category = nil
    @categories = Category.find(:all, :conditions => {:parent_id => nil } )
  end

  def show
    @category = Category.find(params[:id])
    @categories = @category.subcategories
    render :action => :index
  end

  def new
    @category = Category.new
    @category.parent = Category.find(params[:id]) unless params[:id].nil?
  end
end
