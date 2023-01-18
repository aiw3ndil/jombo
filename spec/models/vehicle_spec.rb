# frozen_string_literal: true

# == Schema Information
#
# Table name: vehicles
#
#  id              :bigint           not null, primary key
#  brand           :string
#  color           :string
#  model           :string
#  seats_available :string
#  type            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  profile_id      :bigint           not null
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
  pending "add some examples to (or delete) #{__FILE__}"
end
