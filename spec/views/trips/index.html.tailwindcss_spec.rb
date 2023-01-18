require 'rails_helper'

RSpec.describe "trips/index", type: :view do
  before(:each) do
    assign(:trips, [
      Trip.create!(
        source: "",
        destination: "",
        stops: "",
        profile: nil
      ),
      Trip.create!(
        source: "",
        destination: "",
        stops: "",
        profile: nil
      )
    ])
  end

  it "renders a list of trips" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
