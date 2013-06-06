class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login
 
  private
 
  def require_login
    unless session[:user_id].present?
      redirect_to landing_url
    end
  end  
  
  def sort_column
    Item.column_names.include?(params[:sort]) ? params[:sort] : "due"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
