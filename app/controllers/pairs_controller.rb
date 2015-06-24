class PairsController < ApplicationController
  before_action :logged_in?

  def index
    matches = Match.where(match_uid: current_user.uid).where(status: "success").pluck(:user_id)
    @pairs = User.where(id: matches)
  end
end
