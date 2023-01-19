require 'rails_helper'

RSpec.describe "stops/edit", type: :view do
  let(:stop) {
    Stop.create!(
      duration: 1,
      place: "",
      trip: nil
    )
  }

  before(:each) do
    assign(:stop, stop)
  end

  it "renders the edit stop form" do
    render

    assert_select "form[action=?][method=?]", stop_path(stop), "post" do

      assert_select "input[name=?]", "stop[duration]"

      assert_select "input[name=?]", "stop[place]"

      assert_select "input[name=?]", "stop[trip_id]"
    end
  end
end
