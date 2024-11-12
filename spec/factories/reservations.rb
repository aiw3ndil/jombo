# == Schema Information
#
# Table name: reservations
#
#  id                 :bigint           not null, primary key
#  status             :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  profile_id         :bigint           not null
#  profile_request_id :bigint           not null
#  trip_id            :bigint           not null
#
# Indexes
#
#  index_reservations_on_profile_id          (profile_id)
#  index_reservations_on_profile_request_id  (profile_request_id)
#  index_reservations_on_trip_id             (trip_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#  fk_rails_...  (profile_request_id => profiles.id)
#  fk_rails_...  (trip_id => trips.id)
#
FactoryBot.define do
  factory :reservation do
    profile
    trip
    status { 'sent' }
  end
end
