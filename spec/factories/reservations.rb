FactoryBot.define do
  factory :reservation do
    profile
    trip
    status { 'sent' }
  end
end
