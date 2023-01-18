# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'trips/edit', type: :view do
  let(:trip) do
    Trip.create!(
      source: '',
      destination: '',
      stops: '',
      profile: nil
    )
  end

  before(:each) do
    assign(:trip, trip)
  end

  it 'renders the edit trip form' do
    render

    assert_select 'form[action=?][method=?]', trip_path(trip), 'post' do
      assert_select 'input[name=?]', 'trip[source]'

      assert_select 'input[name=?]', 'trip[destination]'

      assert_select 'input[name=?]', 'trip[stops]'

      assert_select 'input[name=?]', 'trip[profile_id]'
    end
  end
end
