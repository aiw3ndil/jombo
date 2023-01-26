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
#  status          :string           default("open")
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
  has_many :stops, dependent: :destroy
  has_many :reservations, dependent: :destroy

  accepts_nested_attributes_for :stops, allow_destroy: :true, reject_if: proc { |att| att['place'].blank? }

  scope :coming, -> { where("start_date > ?", DateTime.now) }

  enum status: {
    open: 'open',
    closed: 'closed',
    canceled: 'canceled'
  }

  def free_seats
    reserved_seats = Reservation.where(trip_id: id, status: 'approved').count
    seats_available - reserved_seats
  end

end
