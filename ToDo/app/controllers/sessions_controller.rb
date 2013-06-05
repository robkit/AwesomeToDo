class SessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]
  
  def destroy
    session[:user_id] = nil
    redirect_to lists_url
  end
  
  def new
  end

  def create
    user = User.find_by_name(params["name"])

    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      redirect_to lists_url
    else
      redirect_to login_url, notice: "Unknown username or password."
    end

  end
end
