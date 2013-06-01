class CategoriesController < ApplicationController

  def index
    if session[:user_id].present? && User.find_by_id(session[:user_id]).name == "Admin"
      @categories = Category.all
    else
      redirect_to lists_url
    end 
  end

  def show
    redirect_to lists_url
  end

  def new
    if session[:user_id].present?
      @category = Category.new
    else
      redirect_to lists_url
    end
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
    if session[:user_id].present?
      @category = Category.find_by_id(params[:id])
    else
      redirect_to lists_url
    end
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
