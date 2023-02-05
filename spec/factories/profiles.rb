# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    city { 'Madrid' }
    country { 'Spain' }
    first_name { 'First name' }
    last_name { 'Last name' }
    postal_code { '28027' }
    region { 'Madrid' }
    street { 'Calle de prueba 7' }
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { '123456' }
    verified { false }
    user
  end
end
