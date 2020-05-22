class EventAttendance < ApplicationRecord
  validates :guest_id, uniqueness: { scope: :attended_event_id }
  belongs_to :guest, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'
end
