class MatchesController < ApplicationController
  def index
    @matches = User.paginate(page: params[:page], per_page: 1)
  end
end
