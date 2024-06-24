# frozen_string_literal: true

# == Schema Information
#
# Table name: profiles
#
#  id          :bigint           not null, primary key
#  city        :string
#  country     :string
#  first_name  :string
#  last_name   :string
#  postal_code :string
#  region      :string
#  street      :string
#  username    :string
#  verified    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:user) { create(:user) }
  let(:profile) { create(:profile, user: user) }
  
  describe 'username' do
    it 'must be unique and cannot be saved' do
      profile_2 = build(:profile, username: profile.username)
      profile_2.valid?
      
      expect(profile_2.errors[:username].size).to eq(1)
      expect { profile_2.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
    
    it 'changes username' do
      expect { profile.update(username: 'new_username') }.to change(profile, :username)
    end
  end
end
