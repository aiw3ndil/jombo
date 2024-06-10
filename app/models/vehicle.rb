# frozen_string_literal: true

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
class Vehicle < ApplicationRecord
  belongs_to :profile
  
  validates :vehicle_type, presence: true
  validates :brand, presence: true
  validates :model, presence: true
  validates :color, presence: true

  enum vehicle_type: {
    car: 'car',
    motorbike: 'motorbike',
    truck: 'truck',
    bus: 'bus'
  }

  enum color: {
    black: 'black',
    silver: 'silver',
    gray: 'gray',
    white: 'white',
    maroon: 'maroon',
    red: 'red',
    purple: 'purple',
    fuchsia: 'fuchsia',
    green: 'green',
    lime: 'lime',
    olive: 'olive',
    yellow: 'yellow',
    navy: 'navy',
    blue: 'blue',
    teal: 'teal',
    aqua: 'aqua'
  }
end
