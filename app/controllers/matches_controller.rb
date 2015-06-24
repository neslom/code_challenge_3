class MatchesController < ApplicationController
  def index
    @matches = User.paginate(page: params[:page], per_page: 1)
  end

  def update
    if current_user.matches.create(match_uid: params[:user_uid],
                                like: params[:like])
  end
end
