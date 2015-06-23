require "rails_helper"

RSpec.describe User do
  it "has a collection of languages" do
    user = User.create(uid: "1241sfd")
    user.languages.create(name: "ruby")
    user.languages.create(name: "python")

    expect(user.languages.count).to eq(2)
  end

  describe "#first_visit?" do
    it "returns true if the user was just created" do
      user = User.create(uid: "1241sfd")

      expect(user.first_visit?).to be_truthy
    end
  end
end
