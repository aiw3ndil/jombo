# frozen_string_literal: true

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
class Trip < ApplicationRecord
  belongs_to :profile
end
