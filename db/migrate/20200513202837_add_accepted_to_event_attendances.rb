class AddAcceptedToEventAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :event_attendances, :accepted, :boolean, default: false
  end
end
