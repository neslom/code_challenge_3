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

  describe "#update_info" do
    it "updates a user's description and languages" do
      user = User.create(uid: "1241sfd", description: "hey")

      expect(user.description).to eq("hey")
      expect(user.languages).to be_empty

      params = {description: "yolo", languages: {"scala" => "1"}}

      user.update_info(params)

      expect(user.description).to eq("yolo")
      expect(user.languages.first.name).to eq("scala")
    end
  end
end
