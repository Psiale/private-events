require 'rails_helper'

RSpec.describe 'User visiting the home page' do
    scenario "and creating an user" do
        visit root_path
        fill_in 'Name', with: 'User test'
        
        click_on 'Submit'
        expect(page).to have_content("User test's Events")
    end
end