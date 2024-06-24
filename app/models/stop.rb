# frozen_string_literal: true

# == Schema Information
#
# Table name: stops
#
#  id          :bigint           not null, primary key
#  description :string
#  duration    :integer
#  place       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  trip_id     :bigint           not null
#
# Indexes
#
#  index_stops_on_trip_id  (trip_id)
#
# Foreign Keys
#
#  fk_rails_...  (trip_id => trips.id)
#
class Stop < ApplicationRecord
  belongs_to :trip
  
  validates :place, presence: true
  validates :duration, presence: true
end
