# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reservations/edit', type: :view do
  let(:reservation) do
    Reservation.create!(
      profile: nil,
      trip: nil,
      status: 'MyString'
    )
  end

  before(:each) do
    assign(:reservation, reservation)
  end

  it 'renders the edit reservation form' do
    render

    assert_select 'form[action=?][method=?]', reservation_path(reservation), 'post' do
      assert_select 'input[name=?]', 'reservation[profile_id]'

      assert_select 'input[name=?]', 'reservation[trip_id]'

      assert_select 'input[name=?]', 'reservation[status]'
    end
  end
end
