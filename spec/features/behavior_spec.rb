require 'rails_helper'

RSpec.describe 'User session actions', type: :feature do
    before :each do
        User.create(name: "Oscar")
    end

    scenario "creating a user" do
        visit root_path
        fill_in 'Name', with: 'User test'
        click_on 'Submit'
        expect(page).to have_content("User test's Events")
    end

    scenario "creating a user with duplicate name" do
        visit root_path
        fill_in "Name", with: "Oscar"
        click_on 'Submit'
        expect(page).to have_content("Error while creating user. Maybe change name?")
    end

    scenario "user logs in successfully" do
        visit sessions_new_path
        fill_in "Name", with: "Oscar"
        click_on "Submit"
        expect(page).to have_content("Success: You are now LOGGED IN!")
    end

    scenario "User fails trying to log in" do
        visit sessions_new_path
        fill_in "Name", with: "Inexistent"
        click_on "Submit"
        expect(page).to have_content("Who the HECK is Inexistent??? That user name does not EXIST!!")
    end

    scenario "user logs out" do
        visit sessions_new_path
        fill_in "Name", with: "Oscar"
        click_on "Submit"
        click_on "Log out"
        expect(page).to have_content("Logged out!")
    end
end

RSpec.describe 'Creating a new event', type: :feature do
    before :each do
        User.create(name: "Oscar")
        visit sessions_new_path
        fill_in "Name", with: "Oscar"
        click_on "Submit"
        visit new_event_path
    end
    scenario "Fail to create a new event" do
        click_on "Submit"
        expect(page).to have_content("Could not create event.")
    end
    scenario "Create new event successfully" do
        fill_in "Location", with: "Somewhere"
        fill_in "Time", with:  DateTime.now + 1.day
        click_on "Submit"
        
    end
end


RSpec.describe "Creating a new invitation", type: :feature do
    before :each do
        User.create(name: "Alexis")
        User.create(name: "Oscar")
        visit sessions_new_path
        fill_in "Name", with: "Oscar"
        click_on "Submit"
        click_on "Host new event"
        fill_in "Location", with: "Somewhere"
        fill_in "Time", with:  DateTime.now + 2.day
        click_on "Submit"
    end
    scenario "Create a new invitation successfully" do

        click_on "Show"
        click_on "Invite"
        expect(page).to have_content("Event attendance was successfully created.")
    end

    scenario "Checking for invitations to render" do
        click_on "Show"
        click_on "Invite"
        visit sessions_new_path
        fill_in "Name", with: "Alexis"
        click_on "Submit"
        click_on "My hosted events"
        expect(page).to have_content("Accept")
    end

    scenario "Accepting an invitation" do
        click_on "Show"
        click_on "Invite"
        visit sessions_new_path
        fill_in "Name", with: "Alexis"
        click_on "Submit"
        click_on "My hosted events"
        click_on "Accept"
        expect(page).to have_content("Event attendance was successfully updated.")
    end

    scenario "Declining an invitation" do
        click_on "Show"
        click_on "Invite"
        visit sessions_new_path
        fill_in "Name", with: "Alexis"
        click_on "Submit"
        click_on "My hosted events"
        click_on "Accept"
        click_on "Decline"
        expect(page).to have_content("Event attendance was successfully updated.")
    end
end