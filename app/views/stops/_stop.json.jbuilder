# frozen_string_literal: true

json.extract! stop, :id, :duration, :place, :trip_id, :created_at, :updated_at
json.url stop_url(stop, format: :json)
