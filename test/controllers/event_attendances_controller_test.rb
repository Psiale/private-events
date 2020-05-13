require 'test_helper'

class EventAttendancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_attendance = event_attendances(:one)
  end

  test "should get index" do
    get event_attendances_url
    assert_response :success
  end

  test "should get new" do
    get new_event_attendance_url
    assert_response :success
  end

  test "should create event_attendance" do
    assert_difference('EventAttendance.count') do
      post event_attendances_url, params: { event_attendance: {  } }
    end

    assert_redirected_to event_attendance_url(EventAttendance.last)
  end

  test "should show event_attendance" do
    get event_attendance_url(@event_attendance)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_attendance_url(@event_attendance)
    assert_response :success
  end

  test "should update event_attendance" do
    patch event_attendance_url(@event_attendance), params: { event_attendance: {  } }
    assert_redirected_to event_attendance_url(@event_attendance)
  end

  test "should destroy event_attendance" do
    assert_difference('EventAttendance.count', -1) do
      delete event_attendance_url(@event_attendance)
    end

    assert_redirected_to event_attendances_url
  end
end
