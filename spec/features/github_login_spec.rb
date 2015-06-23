require "rails_helper"
require "./spec/support/oauth_login"

RSpec.describe "Login with Github OAuth" do
  scenario "new user clicks button to login and is taken to a new user info page" do
    login_with_oauth

    user = User.last

    expect(current_path).to eq(edit_user_path(user))
  end

  scenario "user fills in text box with description about him or herself" do
    login_with_oauth
    user = User.last

    fill_in("user[description]", with: "I like to pair program?")
    check "ruby"

    click_link_or_button("Submit")
    expect(user.description).to include(/like to pair program/)
    expect(user.languages.first).to eq("ruby")
  end
end
