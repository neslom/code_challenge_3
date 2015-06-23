require "rails_helper"
require "./spec/support/oauth_login"

RSpec.describe "Login with Github OAuth" do
  scenario "new user clicks button to login and is taken to a new user info page" do
    login_with_oauth
    user = User.last

    expect(current_path).to eq(edit_user_path(user))
  end

  xscenario "user fills in text box with description about him or herself" do
    Language.create(name: "ruby")
    login_with_oauth
    user = User.last

    fill_in("user[description]", with: "I like to pair program")
    check "user[languages][ruby]"

    click_link_or_button("Update User")

    expect(current_path).to eq(root_path)
    expect(user.description).to eq("I like to pair program")
    expect(user.languages.first.name).to eq("ruby")
  end
end
