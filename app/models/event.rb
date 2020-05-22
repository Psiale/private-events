class Event < ApplicationRecord
  validates :location, presence: true
  validates :time, presence: true
  belongs_to :host, class_name: 'User', foreign_key: 'host_id', optional: true

  has_many :event_attendances, foreign_key: :attended_event_id
  has_many :guests, through: :event_attendances, source: :guest

  scope :past, -> { where(Event.arel_table[:time].lt(DateTime.now)) }
  scope :upcoming, -> { where(Event.arel_table[:time].gteq(DateTime.now)) }
end
