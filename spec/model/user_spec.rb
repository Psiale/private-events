# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is valid with valid attributes" do
    expect(User.new(name: "Oscar")).to be_valid
  end
  it "is not valid without a name" do
    expect(User.new).to_not be_valid
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    # it { should validate_uniqueness_of(:name) }
  end
end