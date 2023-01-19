# == Schema Information
#
# Table name: stops
#
#  id         :bigint           not null, primary key
#  duration   :integer
#  place      :geometry         point, 0
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  trip_id    :bigint           not null
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
end
