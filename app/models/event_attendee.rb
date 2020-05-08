class EventsAttendees < ApplicationRecord
  belongs_to :guest, class_name: "User"
  belongs_to :attended_event, class_name: "Event"
end