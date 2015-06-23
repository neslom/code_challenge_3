require "rails_helper"

RSpec.describe "Login with Github OAuth" do
  scenario "new user clicks button to login and is taken to a new user info page" do
    visit "/"
    find("#github-login").click

    user = User.last

    expect(current_path).to eq(user_path(user))
  end
end
