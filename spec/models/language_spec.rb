require 'rails_helper'

RSpec.describe Language, type: :model do
  it "is valid with a name" do
    language = Language.new(name: "ruby")
    expect(language).to be_valid
  end

  it "is invalid with a name" do
    language = Language.new(name: "")
    expect(language).to_not be_valid
  end
end
