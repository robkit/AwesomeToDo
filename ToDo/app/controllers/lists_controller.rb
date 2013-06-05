class ListsController < ApplicationController

  def index
    @lists = List.all
    @mylists = User.find_by_id(session[:user_id])
  end

  def show
    @list = List.find_by_id(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    if params[:collaborator_id].present? && params[:collaborator_id] == session[:user_id].to_s
      redirect_to new_list_url, notice: "Stop playing with yourself! You are already a collaborator on this list."
    else
      
      @list = List.new
      @list.title = params[:title]
      @list.save
      @owner = Collaborator.new
      @owner.list_id = @list.id
      @owner.user_id = session[:user_id]
      
      if params[:collaborator_id].present?
        @collaboration = Collaborator.new
        @collaboration.list_id = @list.id
        @collaboration.user_id = params[:collaborator_id]
        @collaboration.save
      end

      if @list.save && @owner.save
        redirect_to lists_url
      else
        render 'new'
      end
    end
  end

  def edit
    @list = List.find_by_id(params[:id])
  end

  def update
    @list = List.find_by_id(params[:id])
    @list.title = params[:title]
    if params[:add_collaborator_id].present?
      match = 0
      @list.collaborators.each do |check|
        if check.user_id.to_s == params[:add_collaborator_id]
          match = 1
        end
      end
      if match == 0
        @collaboration = Collaborator.new
        @collaboration.list_id = @list.id
        @collaboration.user_id = User.find_by_id(params[:add_collaborator_id]).id
        @collaboration.save
      end
    end

    if @list.collaborators.find_by_user_id(params[:x_collaborator_id]).present?
      @list.collaborators.find_by_user_id(params[:x_collaborator_id]).destroy
    end
       
    if @list.save
      redirect_to list_url(@list)
    else
      render 'new'
    end
  end

  def destroy
    @list = List.find_by_id(params[:id])
    @list.collaborators.destroy_all
    @list.items.destroy_all
    @list.destroy

    redirect_to lists_url
  end
end
