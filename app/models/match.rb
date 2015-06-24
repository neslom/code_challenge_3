class Match < ActiveRecord::Base
  belongs_to :user

  def self.potential_matches(current_user)
    matches = where(match_uid: current_user.uid).where(status: "open").pluck(:user_id)
    User.where(id: matches)
  end

  def self.paired?(current_user, user)
    where(match_uid: current_user.uid).where(user_id: user.id).where(status: "open")[0]
  end

  def update_status!(like_status)
    if like_status == "0"
      update_attributes(status: "closed")
      return ""
    elsif like_status == "1"
      update_attributes(status: "success")
      return "Match made!"
    end
  end
end
