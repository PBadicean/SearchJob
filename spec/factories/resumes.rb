# == Schema Information
#
# Table name: resumes
#
#  id          :integer          not null, primary key
#  position    :string           not null
#  salary      :integer          not null
#  user_id     :integer          not null
#  about_me    :string           not null
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tags        :string
#
# Indexes
#
#  index_resumes_on_category_id  (category_id)
#  index_resumes_on_user_id      (user_id)
#

FactoryBot.define do
  factory :resume do
    sequence(:position) { |n| "My position#{n}" }
    sequence(:about_me) { |n| "About me#{n}" }
    sequence(:tags) { |n| "New_tag#{n}" }
    salary 25000
    category
    candidate
  end
end
