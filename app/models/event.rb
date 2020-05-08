class Event < ApplicationRecord
    belongs_to :host, class_name: "User", foreign_key: "host_id", optional: true

    has_many :event_attendances, foreign_key: :attended_event_id
    has_many :guests, through: :event_attendances, source: :guest

    # need to fix the relationship alias, this is searching for a hosts table
end