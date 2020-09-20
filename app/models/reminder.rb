class Reminder < ApplicationRecord

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :scheduled_at, presence: true
  validates :send_email_at, presence: true

  belongs_to :user

end
