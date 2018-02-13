FactoryBot.define do
  factory :vacancy do
    sequence(:name) { |n| "My name#{n}" }
    place_id 'ChIJ53USP0nBhkcRjQ50xhPN_zw'
    discription "The discription of a fictional novels presence to real life events. In the story's of Harry Potter for example: Harry's train ride is an example of children on orphan trains in the united States being transferd from urban to rural places."
    key_skills 'ruby, js, python'
    schedule 1
    experience 1
    category
    employer
    salary_min 30000
    salary_max 70000
  end
end
