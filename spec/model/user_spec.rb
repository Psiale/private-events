# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is valid with valid attributes" do
    expect(User.new(name: "Oscar")).to be_valid
  end
  it "is not valid without a name" do
    expect(User.new).to_not be_valid
  end

end

RSpec.describe Event, :type => :model do
  user = User.create(name: "Oscar")
  event = user.hosted_events.create(location: "House", time: "12")

  expect(event.user.name).to eql("Oscar")
end