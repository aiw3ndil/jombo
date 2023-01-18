# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'vehicles/index', type: :view do
  before(:each) do
    assign(:vehicles, [
             Vehicle.create!(
               type: 'Type',
               brand: 'Brand',
               model: 'Model',
               color: 'Color',
               seats_available: 'Seats Available',
               profile: nil
             ),
             Vehicle.create!(
               type: 'Type',
               brand: 'Brand',
               model: 'Model',
               color: 'Color',
               seats_available: 'Seats Available',
               profile: nil
             )
           ])
  end

  it 'renders a list of vehicles' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Type'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Brand'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Model'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Color'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Seats Available'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
