require "application_system_test_case"

class EventAttendancesTest < ApplicationSystemTestCase
  setup do
    @event_attendance = event_attendances(:one)
  end

  test "visiting the index" do
    visit event_attendances_url
    assert_selector "h1", text: "Event Attendances"
  end

  test "creating a Event attendance" do
    visit event_attendances_url
    click_on "New Event Attendance"

    click_on "Create Event attendance"

    assert_text "Event attendance was successfully created"
    click_on "Back"
  end

  test "updating a Event attendance" do
    visit event_attendances_url
    click_on "Edit", match: :first

    click_on "Update Event attendance"

    assert_text "Event attendance was successfully updated"
    click_on "Back"
  end

  test "destroying a Event attendance" do
    visit event_attendances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event attendance was successfully destroyed"
  end
end
