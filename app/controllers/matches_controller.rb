class MatchesController < ApplicationController
  before_action :set_user, only: [:update]

  def index
    #@matches = current_user.non_matched.paginate(page: params[:page], per_page: 1)
    #@matches = Match.potential_matches(current_user).paginate(page: params[:page], per_page: 1)
    @matches = current_user.ordered_matches.paginate(page: params[:page], per_page: 1)
  end

  def update
    match = Match.where(match_uid: current_user.uid).where(user_id: @user.id)[0]

    if match
      match.update_attributes(status: "closed")
      flash[:notice] = "A MATCH WAS MADE!"
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
