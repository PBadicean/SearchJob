# == Schema Information
#
# Table name: categories
#
#  id        :integer          not null, primary key
#  name      :string
#  parent_id :integer
#
# Indexes
#
#  index_categories_on_parent_id  (parent_id)
#

FactoryBot.define do
  factory :category do
    name 'IT'
  end
end
