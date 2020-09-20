class RemindersMailings

  def self.send_reminders_mailings
    reminders = Reminder.of_today
    return if reminders.empty?
    reminders.each do |reminder|
      ReminderMailer.remind_email(reminder)
    end
  end

end
