class MatchesController < ApplicationController
  def index
    @matches = User.paginate(page: params[:page], per_page: 1)
  end

  def update
    current_user.matches.create(user_id: params[:user_uid],
                                like: params[:like])
  end
end
