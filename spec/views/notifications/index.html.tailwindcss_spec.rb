# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'notifications/index', type: :view do
  before(:each) do
    assign(:notifications, [
             Notification.create!(
               notification_type: 'Notification Type',
               message: 'MyText',
               url: 'Url',
               profile: nil,
               readed: false
             ),
             Notification.create!(
               notification_type: 'Notification Type',
               message: 'MyText',
               url: 'Url',
               profile: nil,
               readed: false
             )
           ])
  end

  it 'renders a list of notifications' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Notification Type'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Url'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
