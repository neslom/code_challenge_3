require "rails_helper"

RSpec.describe "Matches Screen" do
  scenario "click shiny button to find pairs" do
    login_with_oauth
    visit root_path
    click_link_or_button("Find Pairs")

    expect(current_path).to eq(matches_path)
  end
end
