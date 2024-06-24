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
