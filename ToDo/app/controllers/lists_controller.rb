class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find_by_id(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new
    @list.title = params[:title]
    @list.save
    @collaboration = Collaborator.new
    @collaboration.list_id = @list.id
    @collaboration.user_id = User.find_by_id(params[:collaborator_id]).id
       
    if @list.save && @collaboration.save
      redirect_to lists_url
    else
      render 'new'
    end
  end

  def edit
    @list = List.find_by_id(params[:id])
  end

  def update
    @list = List.find_by_id(params[:id])
    @list.title = params[:title]
    @list.save
    if params[:collaborator_id].present?
      @collaboration = Collaborator.new
      @collaboration.list_id = @list.id
      @collaboration.user_id = User.find_by_id(params[:collaborator_id]).id
      @collaboration.save
    end
       
    if @list.save
      redirect_to list_url(@list)
    else
      render 'new'
    end
  end

  def destroy
    @list = List.find_by_id(params[:id])
    @list.destroy
    redirect_to lists_url
  end
end
