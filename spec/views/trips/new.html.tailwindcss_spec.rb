# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'trips/new', type: :view do
  before(:each) do
    assign(:trip, Trip.new(
                    source: '',
                    destination: '',
                    stops: '',
                    profile: nil
                  ))
  end

  it 'renders new trip form' do
    render

    assert_select 'form[action=?][method=?]', trips_path, 'post' do
      assert_select 'input[name=?]', 'trip[source]'

      assert_select 'input[name=?]', 'trip[destination]'

      assert_select 'input[name=?]', 'trip[stops]'

      assert_select 'input[name=?]', 'trip[profile_id]'
    end
  end
end
