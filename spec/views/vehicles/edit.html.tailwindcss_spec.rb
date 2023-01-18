require 'rails_helper'

RSpec.describe "vehicles/edit", type: :view do
  let(:vehicle) {
    Vehicle.create!(
      type: "",
      brand: "MyString",
      model: "MyString",
      color: "MyString",
      seats_available: "MyString",
      profile: nil
    )
  }

  before(:each) do
    assign(:vehicle, vehicle)
  end

  it "renders the edit vehicle form" do
    render

    assert_select "form[action=?][method=?]", vehicle_path(vehicle), "post" do

      assert_select "input[name=?]", "vehicle[type]"

      assert_select "input[name=?]", "vehicle[brand]"

      assert_select "input[name=?]", "vehicle[model]"

      assert_select "input[name=?]", "vehicle[color]"

      assert_select "input[name=?]", "vehicle[seats_available]"

      assert_select "input[name=?]", "vehicle[profile_id]"
    end
  end
end
