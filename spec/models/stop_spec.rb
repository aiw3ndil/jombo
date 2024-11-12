# == Schema Information
#
# Table name: stops
#
#  id          :bigint           not null, primary key
#  description :string
#  duration    :integer
#  place       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  trip_id     :bigint           not null
#
# Indexes
#
#  index_stops_on_trip_id  (trip_id)
#
# Foreign Keys
#
#  fk_rails_...  (trip_id => trips.id)
#
require 'rails_helper'

RSpec.describe Stop, type: :model do
  let(:stop) { create(:stop) }

  describe 'validation' do
    it 'fails' do
      stop.place = nil
      stop.duration = nil
      
      stop.valid?
      
      expect(stop.errors.size).to eq(2)
      expect { stop.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
