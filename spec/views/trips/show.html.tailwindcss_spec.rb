require 'rails_helper'

RSpec.describe "trips/show", type: :view do
  before(:each) do
    assign(:trip, Trip.create!(
      source: "",
      destination: "",
      stops: "",
      profile: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
