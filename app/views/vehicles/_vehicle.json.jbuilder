# frozen_string_literal: true

json.extract! vehicle, :id, :type, :brand, :model, :color, :seats_available, :profile_id, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
