FactoryBot.define do
  factory :resume do
    sequence(:position) { |n| "My position#{n}" }
    sequence(:about_me) { |n| "About me#{n}" }
    sequence(:tags) { |n| "New_tag#{n}" }
    salary 25000
    category
    user
  end
end
