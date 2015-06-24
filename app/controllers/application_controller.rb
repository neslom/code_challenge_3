class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    redirect_to "/" if !current_user
    flash[:notice] = "You must be logged in to do that"
  end

  helper_method :current_user
end
