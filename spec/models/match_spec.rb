require "rails_helper"

RSpec.describe Match do
  let!(:user) do
    User.create(name: "markus",
                picture_url: "https://avatars.githubusercontent.com/u/8800860?v=3",
                description: "pairing is so fun",
                uid: "8800860",
                token: "2f569b64641d7834bd99747c97cef30007e8fb29")
  end

  let!(:user2) do
    User.create(name: "bob",
                picture_url: "https://avatars.githubusercontent.com/u/8800860?v=3",
                description: "pairing is so fun",
                uid: "1111111",
                token: "2f569b64641d7834bd99747c97cef30007e8fb29")
  end

  before(:each) do
    user.languages.create(name: "ruby")
  end

  describe ".potential_matches" do
    it "returns a collection of Users that have clicked 'yes' for the current user" do
      user.matches.create(match_uid: user2.uid, like: "1")

      expect(Match.potential_matches(user2).first).to eq(user)
    end
  end

  describe ".paired" do
    it "returns a user if it is a match" do
      user.matches.create(match_uid: user2.uid, like: "1")
      user2.matches.create(match_uid: user.uid, like: "1")

      expect(Match.paired(user, user2).class).to eq(Match)
    end
  end

  describe "#update_status!" do
    context "second user downvotes the match" do
      it "updates a match status and returns the appropriate message for doing so" do
        user.matches.create(match_uid: user2.uid, like: "1")
        match = user.matches.first

        expect(match.status).to eq("open")

        expect(match.update_status!("0")).to eq("")
        expect(match.status).to eq("closed")
      end
    end

    context "second user approves the match" do
      it "updates a match status and returns the appropriate message for doing so" do
        user.matches.create(match_uid: user2.uid, like: "1")
        match = user.matches.first

        expect(match.status).to eq("open")

        expect(match.update_status!("1")).to eq("Match made!")
        expect(match.status).to eq("success")
      end
    end
  end
end
