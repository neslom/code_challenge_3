class Match < ActiveRecord::Base
  belongs_to :user

  def self.potential_matches(current_user)
    matches = where(match_uid: current_user.uid).where(status: "open").pluck(:user_id)

    User.where(id: matches)
  end
end
