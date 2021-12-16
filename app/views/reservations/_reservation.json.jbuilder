json.extract! reservation, :id, :name, :last_name, :email, :persons, :start_time, :end_time, :message, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
