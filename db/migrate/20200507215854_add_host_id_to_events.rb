class AddHostIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :host_id, :integer
  end
end
