class AddUserIdToReminders < ActiveRecord::Migration[6.0]
  def change
    add_column :reminders, :user_id, :integer, null: false
    add_index :reminders, :user_id
  end
end
