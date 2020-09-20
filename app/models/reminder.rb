class Reminder < ApplicationRecord

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :scheduled_at, presence: true
  validates :send_email_at, presence: true

  belongs_to :user

  scope :of_today, ->  {
    where("extract(year from reminders.send_email_at) = ?
          and extract(month from reminders.send_email_at) = ?
          and extract(day from reminders.send_email_at) = ?",
          Date.today.year , Date.today.month, Date.today.day)
  }

end
