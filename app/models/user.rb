class User < ApplicationRecord
  has_many :hosted_events, foreign_key: "host_id", class_name: "Event"
  
  has_many :event_attendances, foreign_key: :guest_id
  has_many :attended_events, through: :event_attendances
end
