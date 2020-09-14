require 'rails_helper'

RSpec.describe "reminders/show", type: :view do
  before(:each) do
    @reminder = assign(:reminder, Reminder.create!(
      title: "Title",
      description: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
