require 'rails_helper'

RSpec.describe 'Creating a new invitation', type: :feature do
  before :each do
    User.create(name: 'Alexis')
    User.create(name: 'Oscar')
    visit sessions_new_path
    fill_in 'Name', with: 'Oscar'
    click_on 'Submit'
    click_on 'Host new event'
    fill_in 'Location', with: 'Somewhere'
    fill_in 'Time', with: DateTime.now + 2.day
    click_on 'Submit'
  end
  scenario 'Create a new invitation successfully' do
    click_on 'Show'
    click_on 'Invite'
    expect(page).to have_content('Event attendance was successfully created.')
  end

  scenario 'Checking for invitations to render' do
    click_on 'Show'
    click_on 'Invite'
    visit sessions_new_path
    fill_in 'Name', with: 'Alexis'
    click_on 'Submit'
    click_on 'My hosted events'
    expect(page).to have_content('Accept')
  end

  scenario 'Accepting an invitation' do
    click_on 'Show'
    click_on 'Invite'
    visit sessions_new_path
    fill_in 'Name', with: 'Alexis'
    click_on 'Submit'
    click_on 'My hosted events'
    click_on 'Accept'
    expect(page).to have_content('Event attendance was successfully updated.')
  end

  scenario 'Declining an invitation' do
    click_on 'Show'
    click_on 'Invite'
    visit sessions_new_path
    fill_in 'Name', with: 'Alexis'
    click_on 'Submit'
    click_on 'My hosted events'
    click_on 'Accept'
    click_on 'Decline'
    expect(page).to have_content('Event attendance was successfully updated.')
  end
end
