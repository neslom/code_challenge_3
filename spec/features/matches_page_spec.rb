require "rails_helper"

RSpec.describe "Matches Screen" do
  let!(:user) do
    User.create(name: "markus",
                picture_url: "https://avatars.githubusercontent.com/u/8800860?v=3",
                description: "pairing is so fun",
                uid: "8800860",
                token: "2f569b64641d7834bd99747c97cef30007e8fb29")
  end

  before(:each) { user.languages.create(name: "ruby") }

  scenario "click to find pairs and see suggestions" do
    login_with_oauth
    visit root_path
    click_link_or_button("Find Pairs")

    expect(current_path).to eq(matches_path)
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.description)
    expect(page).to have_content(user.languages.first.name)
  end

  scenario "clicks check button to 'like' a pair" do
    login_with_oauth
    current_user = User.last
    visit matches_path

    #find(".fa-check").click
    expect do
      click_link_or_button("like me")
      #find(".fa-check").click
    end.to change { current_user.matches.count }.from(0).to(1)

    within(".flash") do
      expect(page).to have_content("You liked #{user.name}")
    end
  end
end
