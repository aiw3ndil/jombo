# frozen_string_literal: true

# == Schema Information
#
# Table name: trips
#
#  id          :bigint           not null, primary key
#  comments    :text
#  destination :string
#  source      :string
#  start_date  :datetime
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
require 'rails_helper'

RSpec.describe Trip, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
