# frozen_string_literal: true

json.array! @stops, partial: 'stops/stop', as: :stop
