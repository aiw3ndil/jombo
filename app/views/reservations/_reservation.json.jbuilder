json.extract! reservation, :id, :profile_id, :trip_id, :status, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
