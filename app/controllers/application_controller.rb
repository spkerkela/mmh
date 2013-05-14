class ApplicationController < ActionController::Base
  before_filter :require_login
  protect_from_forgery

  private
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  helper_method :current_user

  def require_login
  	unless logged_in?
  		flash[:alert] = "You must log in"
  		redirect_to users_path
  	end
  end

  def logged_in?
  	!!current_user
  end
end
