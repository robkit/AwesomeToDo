class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by_id(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new
    @category.category = params[:category]
    
    if @category.save
      redirect_to categories_url
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find_by_id(params[:id])
  end

  def update
    @category = Category.find_by_id(params[:id])
    @category.category = params[:category]
    
    if @category.save
      redirect_to categories_url
    else
      render 'new'
    end
  end

  def destroy
    @category = Category.find_by_id(params[:id])
    @category.destroy
    redirect_to categories_url
  end
end
