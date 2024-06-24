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
