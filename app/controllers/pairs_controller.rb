class PairsController < ApplicationController
  def index
    user_uids = current_user.matches.where(status: "success").pluck(:match_uid)
    @pairs = User.where(id: user_uids)
  end
end
