class MatchesController < ApplicationController
  before_action :set_user, only: [:update]

  def index
    @matches = User.paginate(page: params[:page], per_page: 1)
  end

  def update
    current_page = params[:page]

    if current_user.matches.create(match_uid: params[:match_uid],
                                like: params[:like])
      flash[:notice] = "You liked #{@user.name}"
      redirect_to :back
    else
      flash[:alert] = "Uh oh. Try again"
    end
  end

  private

  def set_user
    @user = User.find_by(uid: params[:match_uid])
  end
end
