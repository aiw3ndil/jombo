require 'rails_helper'

RSpec.describe "notifications/new", type: :view do
  before(:each) do
    assign(:notification, Notification.new(
      notification_type: "MyString",
      message: "MyText",
      url: "MyString",
      profile: nil,
      readed: false
    ))
  end

  it "renders new notification form" do
    render

    assert_select "form[action=?][method=?]", notifications_path, "post" do

      assert_select "input[name=?]", "notification[notification_type]"

      assert_select "textarea[name=?]", "notification[message]"

      assert_select "input[name=?]", "notification[url]"

      assert_select "input[name=?]", "notification[profile_id]"

      assert_select "input[name=?]", "notification[readed]"
    end
  end
end
