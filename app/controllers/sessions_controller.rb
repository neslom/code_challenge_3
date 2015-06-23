class SessionsController < ApplicationController
  def new
  end

  def create
    data = request.env["omniauth.auth"]
    user = User.find_or_create_from_auth(data)

    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.name}!"
      if user.first_visit?
        redirect_to edit_user_path(user)
      else
        redirect_to root_path
      end
    else
      flash[:notice] = "Sorry, something went wrong"
      redirect_to "/"
    end
  end
end
