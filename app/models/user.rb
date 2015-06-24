class User < ActiveRecord::Base
  has_many :user_languages
  has_many :languages, through: :user_languages
  has_many :matches

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

  def update_info(params)
    update_attributes(description: params[:description])

    selected_languages = params[:languages].keep_if do |k, v|
      v == "1"
    end

    selected_languages.keys.each { |name| self.languages.create(name: name) }

    return self
  end
end
