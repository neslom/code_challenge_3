class User < ActiveRecord::Base
  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(uid: data.uid)

    user.name = data.info.nickname
    user.picture_url = data.info.image
    user.token = data.credentials.token

    user
  end

  def new_record?
  end
end
