# frozen_string_literal: true

# == Schema Information
#
# Table name: notifications
#
#  id                :bigint           not null, primary key
#  message           :text
#  notification_type :string           default("system")
#  readed            :boolean
#  url               :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  profile_id        :bigint           not null
#
# Indexes
#
#  index_notifications_on_profile_id  (profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#
require 'rails_helper'

RSpec.describe Notification, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
