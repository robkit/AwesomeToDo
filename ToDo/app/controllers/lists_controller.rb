class ListsController < ApplicationController

  def index
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
      redirect_to new_list_url, notice: "Stop playing with yourself!"
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

      if @list.save  && @owner.save
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
    @list.save
    if params[:collaborator_id].present?
      check = Collaborator.find_all_by_list_id(params[:id])
      match = 0
      check.each do |collab|
        if collab.user_id.to_s == params[:collaborator_id]
          match = 1
        end
      end
      if match == 0
        @collaboration = Collaborator.new
        @collaboration.list_id = @list.id
        @collaboration.user_id = User.find_by_id(params[:collaborator_id]).id
        @collaboration.save
      end
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
    @list.destroy

    redirect_to lists_url
  end
end
