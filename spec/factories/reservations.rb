FactoryBot.define do
  factory :reservation do
    user
    item
    start { Date.today }
    finish { Date.today + 1.week }
    day_cost { 10.0 }
    total_days { 7 }
    total_cost { 70.0 }
    city { 'Sample City' }
  end
end
