class Event < ApplicationRecord
belongs_to :host, class_name: "User", foreign_key: "user_id", optional: true
# need to fix the relationship alias, this is searching for a hosts table
end
