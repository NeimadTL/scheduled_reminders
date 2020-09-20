class AddSendEmailAtToReminders < ActiveRecord::Migration[6.0]
  def change
    add_column :reminders, :send_email_at, :datetime
  end
end
