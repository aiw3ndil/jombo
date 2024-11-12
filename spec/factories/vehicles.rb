# == Schema Information
#
# Table name: vehicles
#
#  id           :bigint           not null, primary key
#  brand        :string
#  color        :string
#  model        :string
#  vehicle_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  profile_id   :bigint           not null
#
# Indexes
#
#  index_vehicles_on_profile_id  (profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#
FactoryBot.define do
  factory :vehicle do
    profile
    vehicle_type { 'car' }
    brand { "Ford" }
    model { "T" }
    color { 'black' }
  end
end
