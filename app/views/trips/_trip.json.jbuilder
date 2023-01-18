# frozen_string_literal: true

json.extract! trip, :id, :start_date, :source, :destination, :stops, :profile_id, :created_at, :updated_at
json.url trip_url(trip, format: :json)
