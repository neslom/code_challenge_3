require "rails_helper"

RSpec.describe "Pending matches show up first" do
  let!(:user) do
    User.create(name: "markus",
                picture_url: "https://avatars.githubusercontent.com/u/8800860?v=3",
                description: "pairing is so fun",
                uid: "8800860",
                token: "2f569b64641d7834bd99747c97cef30007e8fb29")
  end

  before(:each) { user.languages.create(name: "ruby") }

  scenario "existing user selects 'like' for an other user and when they log in they see the liker's info" do
    # match_uid of the stubbed out user for loging in with oauth

    user.matches.create(match_uid: "123456789",
                        like: "1")
    login_with_oauth

    expect(page).to have_content(user.name)
  end
end
