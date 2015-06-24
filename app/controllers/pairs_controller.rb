class PairsController < ApplicationController
  def index
    matches = Match.where(match_uid: current_user.uid).where(status: "success").pluck(:user_id)
    @pairs = User.where(id: matches)
  end
end
