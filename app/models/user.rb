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

  def ordered_matches
    arr = []
    arr << Match.potential_matches(self)
    arr << self.non_matched
    return arr.flatten
  end

  def match_created?(match_uid, like_status)
    matches.create(match_uid: match_uid, like: like_status)
  end

  def non_matched
    User.where.not(uid: matched_uids)
  end

  private

  def matched_uids
    matches.pluck(:match_uid)
  end
end
