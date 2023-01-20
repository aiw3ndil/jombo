# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'stops/show', type: :view do
  before(:each) do
    assign(:stop, Stop.create!(
                    duration: 2,
                    place: '',
                    trip: nil
                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
