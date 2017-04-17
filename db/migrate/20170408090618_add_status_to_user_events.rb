class AddStatusToUserEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :user_events, :status, :string
  end
end
