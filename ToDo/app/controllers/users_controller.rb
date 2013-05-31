class UsersController < ApplicationController

  def about
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
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
    @user = User.find_by_id(params[:id])
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
    @user.destroy
    redirect_to users_url
  end
end
