class User < ActiveRecord::Base
  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(uid: data.uid)

    user.name = data.info.nickname
    user.picture_url = data.info.image
    user.token = data.credentials.token

    user.save

    user
  end

  def first_visit?
    (Time.now - created_at) < 30
  end
end
