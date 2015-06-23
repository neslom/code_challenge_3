class UsersController < ApplicationController
  before_action :set_user, only: [:edit]

  def edit

  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
