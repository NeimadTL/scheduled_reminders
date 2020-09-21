require 'rails_helper'

RSpec.describe RemindersMailings do

  it "should return nil as no reminders have reminder emails to be sent today" do
    Reminder.create(title: 'title1', description: 'description',
      scheduled_at: '1921-09-20 12:59:00', send_email_at: "1821-09-20 12:59:00", user_id: 1)
    Reminder.create(title: 'title2', description: 'description',
      scheduled_at: '1821-09-20 12:59:00', send_email_at: "1721-09-20 12:59:00", user_id: 1)
    expect(RemindersMailings.send_reminders_mailings).to be nil
  end

  it "should return reminders count as there are reminders that have reminder emails to be sent today" do
    Reminder.create!(title: 'title1', description: 'description',
      scheduled_at: '2020-11-20 12:59:00', send_email_at: DateTime.now.to_s, user_id: 1)
    Reminder.create!(title: 'title2', description: 'description',
      scheduled_at: '2020-11-20 12:59:00', send_email_at: DateTime.now.to_s, user_id: 1)
    Reminder.create!(title: 'title3', description: 'description',
      scheduled_at: '2020-11-20 12:59:00', send_email_at: DateTime.now.to_s, user_id: 1)
    expect(RemindersMailings.send_reminders_mailings).to eql 3
  end


end
