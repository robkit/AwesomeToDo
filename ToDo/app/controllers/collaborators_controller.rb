class CollaboratorsController < ApplicationController

  def index
    @collaborators = Collaborator.all
  end

  def show
    @collaborator = Collaborator.find_by_id(params[:id])
  end

  def new
    @collaborator = Collaborator.new
  end

  def create
    @collaborator = Collaborator.new
    @collaborator.name = params[:name]
    @collaborator.nickname = params[:nickname]
    @collaborator.user_id = params[:user_id]
    
    if @collaborator.save
      redirect_to collaborators_url
    else
      render 'new'
    end
  end

  def edit
    @collaborator = Collaborator.find_by_id(params[:id])
  end

  def update
    @collaborator = Collaborator.find_by_id(params[:id])
    @collaborator.name = params[:name]
    @collaborator.nickname = params[:nickname]
    @collaborator.user_id = params[:user_id]
    
    if @collaborator.save
      redirect_to collaborators_url
    else
      render 'new'
    end
  end

  def destroy
    @collaborator = Collaborator.find_by_id(params[:id])
    @collaborator.destroy
    redirect_to collaborators_url
  end
end
