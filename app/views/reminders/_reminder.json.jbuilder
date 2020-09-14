json.extract! reminder, :id, :title, :description, :scheduled_at, :created_at, :updated_at
json.url reminder_url(reminder, format: :json)
