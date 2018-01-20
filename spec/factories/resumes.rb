FactoryBot.define do
  factory :resume do
    sequence(:position) { |n| "position#{n}" }
    sequence(:about_me) { |n| "about_me#{n}" }
    sequence(:tags) { |n| "tags#{n}" }
    salary 25000
    category
    user
  end
end
