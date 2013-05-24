class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by_id(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.task = params[:task]
    @item.due = params[:due]
    @item.priority = params[:priority]
    @item.status = params[:status]
    @item.list_id = params[:list_id]
    @item.collaborator_id = params[:collaborator_id]
    @item.user_id = params[:user_id]
    @item.category_id = params[:category_id]
    
    if @item.save
      redirect_to items_url
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find_by_id(params[:id])
  end

  def update
    @item = Item.find_by_id(params[:id])
    @item.task = params[:task]
    @item.due = params[:due]
    @item.priority = params[:priority]
    @item.status = params[:status]
    @item.list_id = params[:list_id]
    @item.collaborator_id = params[:collaborator_id]
    @item.user_id = params[:user_id]
    @item.category_id = params[:category_id]
    
    if @item.save
      redirect_to items_url
    else
      render 'new'
    end
  end

  def destroy
    @item = Item.find_by_id(params[:id])
    @item.destroy
    redirect_to items_url
  end
end
