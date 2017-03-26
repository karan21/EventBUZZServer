json.extract! event, :id, :name, :description, :date, :time, :capacity, :venue, :duration, :city, :image, :created_at, :updated_at
json.url event_url(event, format: :json)
