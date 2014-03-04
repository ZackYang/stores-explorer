# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :external_source do
    name      Faker::Company.name
    latitude  Faker::Address.latitude
    longitude Faker::Address.longitude
    state     Faker::Address.state_abbr
    address   Faker::Address.street_address
    city      Faker::Address.city
    url       Faker::Internet.url
    tel       Faker::PhoneNumber.phone_number
    zip       Faker::Address.zip
    source "Factual"
    sequence(:source_id) { |n| "#{source}_#{n}" }
  end
end
