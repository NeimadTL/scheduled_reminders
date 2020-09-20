class ReminderMailer < ApplicationMailer

  default from: 'no_reply@evopark.com'

  def remind_email(reminder, opts={})
    @reminder = reminder
  	mail(to: @reminder.user.email)
  	opts[:from] = 'no-reply@example.com'
    opts[:subject] = "Don't you forget this: #{@reminder.title} !"
  end

end
