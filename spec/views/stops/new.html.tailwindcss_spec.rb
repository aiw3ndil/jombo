require 'rails_helper'

RSpec.describe "stops/new", type: :view do
  before(:each) do
    assign(:stop, Stop.new(
      duration: 1,
      place: "",
      trip: nil
    ))
  end

  it "renders new stop form" do
    render

    assert_select "form[action=?][method=?]", stops_path, "post" do

      assert_select "input[name=?]", "stop[duration]"

      assert_select "input[name=?]", "stop[place]"

      assert_select "input[name=?]", "stop[trip_id]"
    end
  end
end
