class RemindersMailings

  # send reminder email for each reminder if any found
  # returns nil when none found
  # returns reminders count when any found
  def self.send_reminders_mailings
    reminders = Reminder.of_today
    return if reminders.empty?
    reminders.each do |reminder|
      ReminderMailer.remind_email(reminder)
    end
    reminders.count
  end

end
