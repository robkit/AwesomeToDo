class UsersController < ApplicationController

  def about
  end

  def index
    if session[:user_id].present? && User.find_by_id(session[:user_id]).name == "Admin"
      @users = User.all
    else
      redirect_to lists_url
    end 
  end

  def show
    if session[:user_id].present?
      @user = User.find_by_id(session[:user_id])
    else
      redirect_to lists_url
    end 
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:name]
    @user.nickname = params[:nickname]
    @user.email = params[:email]
    @user.password = params[:password]
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to lists_url
    else
      redirect_to new_user_url, notice: "Failed to create user profile."
    end
  end

  def edit
    if session[:user_id].present?
      if User.find_by_id(session[:user_id]).name == "Admin"
        @user = User.find_by_id(params[:id])
      else
        @user = User.find_by_id(session[:user_id])
      end
    else
      redirect_to lists_url
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.name = params[:name]
    @user.nickname = params[:nickname]
    @user.email = params[:email]
    @user.password = params[:password]

    if @user.save
      redirect_to users_url
    else
      redirect_to users_url, notice: "Failed to edit user profile."
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.collaborators.destroy_all
    @user.items.destroy_all
    Item.find_all_by_collaborator_id(params[:id]).destroy_all
    @user.destroy
    redirect_to users_url
  end
end
