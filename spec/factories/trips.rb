FactoryBot.define do
  factory :trip do
    profile
    start_date { DateTime.now }
    source { 'Madrid' }
    destination { 'Barcelona' }
    seats_available { 4 }
  end
end
