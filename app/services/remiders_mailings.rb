class RemindersMailings

  def self.send_reminders_mailings
    reminders = Reminder.of_today
    return if reminders.empty?
    reminders.each do |reminder|
      # call ReminderMailer
    end
  end

end
