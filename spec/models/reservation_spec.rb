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
