# spec/models/user_spec.rb
require 'rails_helper'
RSpec.describe User, :type => :model do
  subject { User.new(name: "Oscar")}
  it "is valid with valid attributes" do
    #model constructor tests
    expect(subject).to be_valid
  end
  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid if the name is not unique" do
    oscar = User.create(name: "Oscar")
    expect(subject).to_not be_valid
  end
  it "is valid if the name is unique" do
    oscar = User.create(name: "Oscar")
    subject.name = "Alexis"
    expect(subject).to be_valid
  end
  # model associations test
  it "should have many hosted_events" do
    t = User.reflect_on_association(:hosted_events)
    expect(t.macro).to eq(:has_many)
  end
  it "should have many attended_events" do
    t = User.reflect_on_association(:attended_events)
    expect(t.macro).to eq(:has_many)
  end
  it "should have many event_attendances" do
    t = User.reflect_on_association(:event_attendances)
    expect(t.macro).to eq(:has_many)
  end
end

RSpec.describe Event, :type => :model do
  subject { Event.new(location: "Home", time: "2020-05-18 19:46:03") }
  #model constructor tests
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without valid attributes" do
    subject.location = nil
    expect(subject).to_not be_valid
  end
  it "should belong to host" do
    t = Event.reflect_on_association(:host)
    expect(t.macro).to eq(:belongs_to)
  end
  
end

RSpec.describe EventAttendance, :type => :model do

end

# RSpec.describe EventLogic, :type => :model do
#   # model associations function test
#   it "shoulda validate " do
#   user = User.create(name: "Oscar")
#   event = user.hosted_events.create(location: "House", time: "12")
#   expect(event.host.name).to eql("Oscar")
#   end
# end