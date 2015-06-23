require "rails_helper"
require "./spec/support/oauth_login"

RSpec.describe "Login with Github OAuth" do
  scenario "new user clicks button to login and is taken to a new user info page" do
    login_with_oauth

    user = User.last

    expect(current_path).to eq(edit_user_path(user))
  end
end
