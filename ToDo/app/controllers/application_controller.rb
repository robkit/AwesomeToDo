class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login
 
  private
 
  def require_login
    unless session[:user_id].present?
      redirect_to landing_url
    end
  end

end
