# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :external_source do
    source "Factual"
    sequence(:source_id) { |n| "#{source}_#{n}" }
  end
end
