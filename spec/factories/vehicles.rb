FactoryBot.define do
  factory :vehicle do
    profile
    vehicle_type { 'car' }
    brand { "Ford" }
    model { "T" }
    color { 'black' }
  end
end
