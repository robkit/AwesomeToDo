class ItemsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @myitems = Item.order(sort_column + " " + sort_direction).find_all_by_collaborator_id(session[:user_id])
    @assigneditems = Item.order(sort_column + " " + sort_direction).find_all_by_user_id(session[:user_id])
  end

  def show
    redirect_to lists_url
  end

  def new
    @list = List.find_by_id(params[:id])
  end

  def create
    @item = Item.new
    @item.task = params[:task]
    @item.due = Date.civil(params[:duedate][:year].to_i, params[:duedate][:month].to_i, params[:duedate][:day].to_i)
    @item.priority = params[:priority]
    @item.status = 0
    @item.list_id = params[:list_id]
    @item.collaborator_id = params[:collaborator_id]
    @item.user_id = params[:user_id]
    @item.category_id = params[:category_id]
    
    if @item.save
      redirect_to list_url(params[:list_id])
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
    @item.due = Date.civil(params[:duedate][:year].to_i, params[:duedate][:month].to_i, params[:duedate][:day].to_i)
    @item.priority = params[:priority]
    @item.status = params[:status]
    # @item.list_id = params[:list_id]
    @item.collaborator_id = params[:collaborator_id]
    @item.user_id = params[:user_id]
    @item.category_id = params[:category_id]
    
    if @item.save
      redirect_to list_url(@item.list_id)
    else
      render 'new'
    end
  end

  def destroy
    @item = Item.find_by_id(params[:id])
    redirect_to list_url(Item.find_by_id(params[:id]).list_id)
    @item.destroy
  end
end
