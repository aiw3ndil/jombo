require 'rails_helper'

RSpec.describe "stops/index", type: :view do
  before(:each) do
    assign(:stops, [
      Stop.create!(
        duration: 2,
        place: "",
        trip: nil
      ),
      Stop.create!(
        duration: 2,
        place: "",
        trip: nil
      )
    ])
  end

  it "renders a list of stops" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
