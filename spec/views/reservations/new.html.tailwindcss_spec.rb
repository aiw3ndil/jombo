require 'rails_helper'

RSpec.describe "reservations/new", type: :view do
  before(:each) do
    assign(:reservation, Reservation.new(
      profile: nil,
      trip: nil,
      status: "MyString"
    ))
  end

  it "renders new reservation form" do
    render

    assert_select "form[action=?][method=?]", trip_reservations_path, "post" do

      assert_select "input[name=?]", "reservation[profile_id]"

      assert_select "input[name=?]", "reservation[trip_id]"

      assert_select "input[name=?]", "reservation[status]"
    end
  end
end
