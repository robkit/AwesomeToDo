class CategoriesController < ApplicationController

  def index
    if User.find_by_id(session[:user_id]).name == "Admin"
      @categories = Category.all
    else
      redirect_to lists_url
    end 
  end

  def show
    redirect_to lists_url
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
    if User.find_by_id(session[:user_id]).name == "Admin"
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
    @category.items.each do |c|
      c.category_id = Category.find_by_category(" ").id
      c.save
    end
    @category.destroy
    redirect_to categories_url
  end
end
