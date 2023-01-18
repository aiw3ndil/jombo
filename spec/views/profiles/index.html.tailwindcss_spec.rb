require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        username: "Username",
        first_name: "First Name",
        last_name: "Last Name",
        street: "Street",
        city: "City",
        region: "Region",
        postal_code: "Postal Code",
        country: "Country",
        user: nil
      ),
      Profile.create!(
        username: "Username",
        first_name: "First Name",
        last_name: "Last Name",
        street: "Street",
        city: "City",
        region: "Region",
        postal_code: "Postal Code",
        country: "Country",
        user: nil
      )
    ])
  end

  it "renders a list of profiles" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Username".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Street".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("City".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Region".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Postal Code".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Country".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
