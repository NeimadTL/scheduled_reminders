# Preview all emails at http://localhost:3000/rails/mailers/reminder_mailer
class ReminderMailerPreview < ActionMailer::Preview
  def remind_email
    ReminderMailer.remind_email(Reminder.last)
  end
end
