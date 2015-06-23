require "rails_helper"

RSpec.describe "Matches Screen" do
  scenario "click to find pairs and see suggestions" do
    user = User.create(name: "markus",
                       picture_url: "https://avatars.githubusercontent.com/u/8800860?v=3",
                       description: "pairing is so fun",
                       uid: "8800860",
                       token: "2f569b64641d7834bd99747c97cef30007e8fb29")
    user.languages.create(name: "ruby")

    login_with_oauth
    visit root_path
    click_link_or_button("Find Pairs")

    expect(current_path).to eq(matches_path)

    expect(page).to have_content(user.name)
    expect(page).to have_content(user.description)
    expect(page).to have_content(user.languages.first.name)
  end
end
