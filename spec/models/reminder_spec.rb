require 'rails_helper'

RSpec.describe Reminder, type: :model do

  it { should validate_presence_of :title }
  describe "title uniqueness validation" do
    subject { Reminder.create(title: 'title', description: 'description', user_id: 1) }
    it { should validate_uniqueness_of(:title) }
  end
  it { should validate_presence_of :description }
  it { should validate_presence_of :scheduled_at }

  it { should belong_to :user }

end
