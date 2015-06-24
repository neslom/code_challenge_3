require "rails_helper"

RSpec.describe "Auth" do
  let!(:user) do
    User.create(name: "markus",
                picture_url: "https://avatars.githubusercontent.com/u/8800860?v=3",
                description: "pairing is so fun",
                uid: "8800860",
                token: "2f569b64641d7834bd99747c97cef30007e8fb29")
  end

  scenario "non-logged in user tries to visit matches page but gets denied" do
    visit matches_path

    within(".flash") do
      expect(page).to have_content("You must be logged in to do that")
    end

    expect(current_path).to eq("/")
  end
end
