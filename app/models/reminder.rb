class Reminder < ApplicationRecord

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :scheduled_at, presence: true
end
