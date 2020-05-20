# spec/models/user_spec.rb
require 'rails_helper'
RSpec.describe User, type: :model do
  subject { User.new(name: 'Oscar') }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid if the name is not unique' do
    User.create(name: "Oscar")
    expect(subject).to_not be_valid
  end
  it 'is valid if the name is unique' do
    User.create(name: "Oscar")
    subject.name = 'Alexis'
    expect(subject).to be_valid
  end
  it 'should have many hosted_events' do
    t = User.reflect_on_association(:hosted_events)
    expect(t.macro).to eq(:has_many)
  end
  it 'should have many attended_events' do
    t = User.reflect_on_association(:attended_events)
    expect(t.macro).to eq(:has_many)
  end
  it 'should have many event_attendances' do
    t = User.reflect_on_association(:event_attendances)
    expect(t.macro).to eq(:has_many)
  end
end

RSpec.describe Event, type: :model do
  subject { Event.new(location: 'Home', time: '2020-05-18 19:46:03') }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without valid attributes' do
    subject.location = nil
    expect(subject).to_not be_valid
  end
  it 'should belong to host' do
    t = Event.reflect_on_association(:host)
    expect(t.macro).to eq(:belongs_to)
  end
  it 'should have many event_attendances' do
    t = Event.reflect_on_association(:event_attendances)
    expect(t.macro).to eq(:has_many)
  end
  it 'should have many guests' do
    t = Event.reflect_on_association(:guests)
    expect(t.macro).to eq(:has_many)
  end
end

RSpec.describe EventAttendance, type: :model do
  let(:event) { Event.create(location: 'Home', time: '2020-05-18 19:46:03') }
  let(:user) { User.create(name: 'Oscar') }
  let(:user2) { User.create(name: 'Alexis') }
  subject { EventAttendance.new(attended_event: event, guest: user, accepted: nil) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without valid attributes' do
    subject.attended_event = nil
    expect(subject).to_not be_valid
  end
  it 'is valid if the foreign key pair is unique' do
    EventAttendance.create(attended_event: event, guest: user2, accepted: nil)
    expect(subject).to be_valid
  end
  it 'is not valid if the foreign key pair is not unique' do
    EventAttendance.create(attended_event: event, guest: user, accepted: nil)
    expect(subject).to_not be_valid
  end
  it 'should belong to guest' do
    t = EventAttendance.reflect_on_association(:guest)
    expect(t.macro).to eq(:belongs_to)
  end
  it 'should belong to attended_event' do
    t = EventAttendance.reflect_on_association(:attended_event)
    expect(t.macro).to eq(:belongs_to)
  end
end
