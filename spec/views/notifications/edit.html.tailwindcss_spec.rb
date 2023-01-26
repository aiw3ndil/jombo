# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'notifications/edit', type: :view do
  let(:notification) do
    Notification.create!(
      notification_type: 'MyString',
      message: 'MyText',
      url: 'MyString',
      profile: nil,
      readed: false
    )
  end

  before(:each) do
    assign(:notification, notification)
  end

  it 'renders the edit notification form' do
    render

    assert_select 'form[action=?][method=?]', notification_path(notification), 'post' do
      assert_select 'input[name=?]', 'notification[notification_type]'

      assert_select 'textarea[name=?]', 'notification[message]'

      assert_select 'input[name=?]', 'notification[url]'

      assert_select 'input[name=?]', 'notification[profile_id]'

      assert_select 'input[name=?]', 'notification[readed]'
    end
  end
end
