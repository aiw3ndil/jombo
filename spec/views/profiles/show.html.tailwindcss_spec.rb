require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    assign(:profile, Profile.create!(
      username: "Username",
      first_name: "First Name",
      last_name: "Last Name",
      street: "Street",
      city: "City",
      region: "Region",
      postal_code: "Postal Code",
      country: "Country",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Region/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(//)
  end
end
