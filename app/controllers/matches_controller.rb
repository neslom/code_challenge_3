class MatchesController < ApplicationController
  before_action :set_user, only: [:update]
  before_action :logged_in?

  def index
    #@matches = current_user.non_matched.paginate(page: params[:page], per_page: 1)
    @matches = current_user.ordered_matches.paginate(page: params[:page], per_page: 1)
  end

  def update
    match = Match.paired?(current_user, @user)
    if match
      status = match.update_status!(params[:like])
      flash[:notice] = status if !status.empty?
      redirect_to matches_path
    elsif current_user.matches.create(match_uid: params[:match_uid],
                                      like: params[:like])
      params[:like] == "0" ? liked = "disliked" : liked = "liked"
      flash[:notice] = "You #{liked} #{@user.name}"
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
