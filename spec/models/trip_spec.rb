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
require 'rails_helper'

RSpec.describe Trip, type: :model do
  let(:trip) { create(:trip) }
  let(:user_2) { create(:user) }
  let(:profile_2) { create(:profile, user: user_2) }
  let(:reservation) { create(:reservation, trip:, profile: profile_2, profile_request_id: trip.profile.id) }
  
  describe 'validation' do
    it 'fails' do
      trip.start_date = nil
      trip.source = nil
      trip.destination = nil
      trip.seats_available = nil
      
      trip.valid?
      
      expect(trip.errors.size).to eq(4)
      expect{ trip.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  
  describe 'free seats' do
    it 'must return the available seats' do
      expect(trip.free_seats).to eq(4)
    end
    
    it 'must subtract one seat on reservation' do
      reservation.status = 'approved'
      reservation.save!
      
      expect(trip.free_seats).to eq(3)
    end
  end
end
