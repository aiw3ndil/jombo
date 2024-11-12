# == Schema Information
#
# Table name: trips
#
#  id              :bigint           not null, primary key
#  comments        :text
#  destination     :string
#  seats_available :integer          default(0)
#  source          :string
#  start_date      :datetime
#  status          :string           default("open")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  profile_id      :bigint           not null
#
# Indexes
#
#  index_trips_on_profile_id  (profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#
FactoryBot.define do
  factory :trip do
    profile
    start_date { DateTime.now }
    source { 'Madrid' }
    destination { 'Barcelona' }
    seats_available { 4 }
  end
end
