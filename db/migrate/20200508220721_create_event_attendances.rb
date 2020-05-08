class CreateEventAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :event_attendances, :id => false do |t|
      t.integer :attended_event_id
      t.integer :guest_id

      t.timestamps
    end
  end
end
