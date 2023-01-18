# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'vehicles/show', type: :view do
  before(:each) do
    assign(:vehicle, Vehicle.create!(
                       type: 'Type',
                       brand: 'Brand',
                       model: 'Model',
                       color: 'Color',
                       seats_available: 'Seats Available',
                       profile: nil
                     ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Brand/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/Seats Available/)
    expect(rendered).to match(//)
  end
end
