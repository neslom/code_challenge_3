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

  describe "#matches" do
    it "returns a collection of a user's matches" do
      user = User.create(uid: "1241sfd", description: "hey")
      user2 = User.create(uid: "6666666", description: "hey")

      user.matches.create(match_uid: user2.uid)

      expect(user.matches.last.match_uid).to eq(user2.uid)
    end
  end

  describe "#non_matched" do
    it "returns only matches that have not been liked or disliked by the user" do
      user = User.create(uid: "1241sfd", description: "hey")
      user2= User.create(uid: "12345", description: "yo")

      match = user.matches.create(match_uid: user2.uid,
                          like: "1")

      expect(user.non_matched).to_not include(match)
    end
  end
end
