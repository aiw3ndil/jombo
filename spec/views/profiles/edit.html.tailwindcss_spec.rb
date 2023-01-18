require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  let(:profile) {
    Profile.create!(
      username: "MyString",
      first_name: "MyString",
      last_name: "MyString",
      street: "MyString",
      city: "MyString",
      region: "MyString",
      postal_code: "MyString",
      country: "MyString",
      user: nil
    )
  }

  before(:each) do
    assign(:profile, profile)
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(profile), "post" do

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
