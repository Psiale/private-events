class AddIndextoEventAttendances < ActiveRecord::Migration[6.0]
  def change
    add_index :event_attendances, [:attended_event_id, :guest_id], unique: true
  end
end
