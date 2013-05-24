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
    
    if @list.save
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
    
    if @list.save
      redirect_to lists_url
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
