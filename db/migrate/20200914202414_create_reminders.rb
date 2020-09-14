class CreateReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :reminders do |t|
      t.string :title
      t.text :description
      t.datetime :scheduled_at

      t.timestamps
    end
  end
end
