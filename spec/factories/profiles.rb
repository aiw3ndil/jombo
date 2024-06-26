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
FactoryBot.define do
  factory :profile do
    user
    sequence(:username) { |n| "user#{n}" }
  end
end
