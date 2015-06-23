class SessionsController < ApplicationController
  def new
  end

  def create
    data = request.env["omniauth.auth"]
    user = User.find_or_create_from_auth(data)

    if user && user.new_record?
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to edit_user_path(user)
    elsif user
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash[:notice] = "Sorry, something went wrong"
      redirect_to "/"
    end
  end
end
