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

class Category < ApplicationRecord

  self.table_name = 'categories'

  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy
  has_many :resumes

  belongs_to :parent_category, class_name: 'Category', optional: true

  scope :only_parents, -> { where(parent_id: nil) }

end
