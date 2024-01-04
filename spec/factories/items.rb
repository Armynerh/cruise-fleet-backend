require 'faker'

FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    availability { true }
    cost { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Lorem.paragraph }
    # ... other attributes or associations
  end
end
