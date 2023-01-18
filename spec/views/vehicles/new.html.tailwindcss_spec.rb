# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'vehicles/new', type: :view do
  before(:each) do
    assign(:vehicle, Vehicle.new(
                       type: '',
                       brand: 'MyString',
                       model: 'MyString',
                       color: 'MyString',
                       seats_available: 'MyString',
                       profile: nil
                     ))
  end

  it 'renders new vehicle form' do
    render

    assert_select 'form[action=?][method=?]', vehicles_path, 'post' do
      assert_select 'input[name=?]', 'vehicle[type]'

      assert_select 'input[name=?]', 'vehicle[brand]'

      assert_select 'input[name=?]', 'vehicle[model]'

      assert_select 'input[name=?]', 'vehicle[color]'

      assert_select 'input[name=?]', 'vehicle[seats_available]'

      assert_select 'input[name=?]', 'vehicle[profile_id]'
    end
  end
end
