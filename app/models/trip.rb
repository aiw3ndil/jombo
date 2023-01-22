# frozen_string_literal: true

# == Schema Information
#
# Table name: trips
#
#  id          :bigint           not null, primary key
#  destination :geometry         point, 0
#  source      :geometry         point, 0
#  start_date  :datetime
#  stops       :json
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  profile_id  :bigint           not null
#
# Indexes
#
#  index_trips_on_profile_id  (profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#
class Trip < ApplicationRecord
  belongs_to :profile
end
