FactoryBot.define do
  factory :experience do
    company 'Google'
    sequence(:position) { |n| "Old Position#{n}" }
    sequence(:duty) { |n| "Duty#{n}" }
    date_start Time.now - 3.years
    date_end Time.now - 1.years
  end
end
