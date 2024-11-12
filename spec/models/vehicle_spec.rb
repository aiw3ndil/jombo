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
require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe Vehicle, type: :model do
    let(:vehicle) { create(:vehicle) }
    
    describe 'validation' do
      it 'fails' do
        vehicle.vehicle_type = nil
        vehicle.brand = nil
        vehicle.model = nil
        vehicle.color = nil
        vehicle.valid?
        
        expect(vehicle.errors.size).to eq(4)
        expect{ vehicle.save! }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
