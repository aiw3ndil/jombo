# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'notifications/show', type: :view do
  before(:each) do
    assign(:notification, Notification.create!(
                            notification_type: 'Notification Type',
                            message: 'MyText',
                            url: 'Url',
                            profile: nil,
                            readed: false
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Notification Type/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
