class SessionsController < ApplicationController

  def destroy
    session["user_id"] = nil
    redirect_to "/movies", notice: "Come back soon!"
  end
  
  def new
  end

  def create
    user = User.find_by_name(params["name"])

    if user && user.authenticate(params["password_digest"])
      session["user_id"] = user.id
      redirect_to "/lists", notice: "Welcome back, #{user.name}"
    else
      redirect_to "/login", notice: "Unknown username or password."
    end

  end
end
