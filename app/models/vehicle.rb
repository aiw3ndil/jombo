# frozen_string_literal: true

# == Schema Information
#
# Table name: vehicles
#
#  id         :bigint           not null, primary key
#  brand      :string
#  color      :string
#  model      :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  profile_id :bigint           not null
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
end
