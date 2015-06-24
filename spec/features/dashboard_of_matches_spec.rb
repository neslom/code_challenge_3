require "rails_helper"

RSpec.describe "Dashbord of Matches" do
  let!(:user) do
    User.create(name: "markus",
                picture_url: "https://avatars.githubusercontent.com/u/8800860?v=3",
                description: "pairing is so fun",
                uid: "8800860",
                token: "2f569b64641d7834bd99747c97cef30007e8fb29")
  end

  let!(:user2) do
    User.create(name: "sarah",
                picture_url: "https://avatars.githubusercontent.com/u/8800860?v=3",
                description: "pairing is so fun",
                uid: "1111111",
                token: "3f569b64641d7834bd99747c97cef30007e8fb29")
  end

  before(:each) do
    user.languages.create(name: "ruby")
    #user.matches.create(match_uid: user2.uid, like: "1")
  end

  scenario "user visits match dashboard and sees list of matched pairs" do
    login_with_oauth
    current_user = User.last
    visit root_path
    current_user.matches.create(match_uid: user2.uid, like: "1")
    click_link_or_button("See Pairs")

    expect(current_path).to eq(pairs_path)
  end
end
