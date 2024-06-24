require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:user_2) { create(:user) }
  let(:profile_2) { create(:profile, user: user_2) }
  let(:reservation) { create(:reservation, profile_request_id: profile_2.id) }
  
  describe 'validation' do
    it 'is valid' do
      reservation.valid?
      
      expect(reservation.errors.size).to eq(0)
    end
    
    it 'fails' do
      reservation.profile_request_id = nil
      
      reservation.valid?
      
      expect(reservation.errors.size).to eq(1)
      expect{ reservation.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
