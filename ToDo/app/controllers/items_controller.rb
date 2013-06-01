class ItemsController < ApplicationController

  def index
    if session[:user_id].present?
      @myitems = Item.find_all_by_collaborator_id(session[:user_id])
      @assigneditems = Item.find_all_by_user_id(session[:user_id])
    else
      redirect_to lists_url
    end
  end

  def show
    redirect_to lists_url
  end

  def new
    if session[:user_id].present?
      @list = List.find_by_id(params[:id])
      @collaborators= Array.new
      count=0
      @list.collaborators.each do |c|
        listcollab=Hash.new
        listcollab[:user_id] = c.user_id
        listcollab[:nickname] = User.find_by_id(c.user_id).nickname
        @collaborators[count] = listcollab
        count = count + 1
      end
    else
      redirect_to lists_url
    end
  end

  def create
    @item = Item.new
    @item.task = params[:task]
    @item.due = params[:due]
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
    if session[:user_id].present?
      @item = Item.find_by_id(params[:id])
    else
      redirect_to lists_url
    end
  end

  def update
    @item = Item.find_by_id(params[:id])
    @item.task = params[:task]
    @item.due = params[:due]
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
