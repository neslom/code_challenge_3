require "rails_helper"
require "./spec/support/oauth_login"

RSpec.describe "Login with Github OAuth" do
  scenario "new user clicks button to login and is taken to a new user info page" do
    login_with_oauth
    user = User.last

    within(".flash") do
      expect(page).to have_content("Welcome, #{user.name}!")
    end

    expect(current_path).to eq(edit_user_path(user))
  end

  scenario "user fills in text box with description about him or herself" do
    Language.create(name: "ruby")
    login_with_oauth
    user = User.last

    fill_in("user[description]", with: "I like to pair program")
    check "user[languages][ruby]"

    click_link_or_button("Update User")

    within(".flash") do
      expect(page).to have_content("Your info has been saved")
    end

    expect(current_path).to eq(root_path)
    expect(user.languages.first.name).to eq("ruby")
    expect(User.last.description).to eq("I like to pair program")
  end

  scenario "user can logout once in" do
    login_with_oauth
    user = User.last

    click_link_or_button("Logout")

    expect(page).to have_content("Peace out")
  end
end
