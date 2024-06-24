FactoryBot.define do
  factory :stop do
    trip
    place { 'Madrid' }
    duration { 10 }
  end
end
