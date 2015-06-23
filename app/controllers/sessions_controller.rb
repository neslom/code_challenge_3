class SessionsController < ApplicationController
  def new
  end

  def create
    data = request.env["omniauth.auth"]
    user = User.find_or_create_from_auth(data)

    if user
      redirect_to edit_user_path(user)
      flash[:notice] = "Welcome, #{user.name}!"
    else
      redirect_to "/"
      flash[:notice] = "Sorry, something went wrong"
    end
  end
end
