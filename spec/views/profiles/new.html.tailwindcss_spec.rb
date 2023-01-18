require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
      username: "MyString",
      first_name: "MyString",
      last_name: "MyString",
      street: "MyString",
      city: "MyString",
      region: "MyString",
      postal_code: "MyString",
      country: "MyString",
      user: nil
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input[name=?]", "profile[username]"

      assert_select "input[name=?]", "profile[first_name]"

      assert_select "input[name=?]", "profile[last_name]"

      assert_select "input[name=?]", "profile[street]"

      assert_select "input[name=?]", "profile[city]"

      assert_select "input[name=?]", "profile[region]"

      assert_select "input[name=?]", "profile[postal_code]"

      assert_select "input[name=?]", "profile[country]"

      assert_select "input[name=?]", "profile[user_id]"
    end
  end
end
