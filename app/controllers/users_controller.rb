class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :set_languages, only: [:edit]
  before_action :logged_in?

  def edit
  end

  def update
    if @user.update_info(user_params)
      flash[:notice] = "Your info has been saved"
      redirect_to root_path
    else
      flash[:notice] = "Uh oh. Try again!"
      render :edit
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def set_languages
    @languages = Language.all
  end

  def user_params
    params.require(:user).permit(:description, languages: [:ruby, :python, :scala, :go])
  end
end
