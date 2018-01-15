# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_parent_id  (parent_id)
#

require 'rails_helper'

RSpec.describe Category, type: :model do

  it { should have_many(:subcategories) }
  it { should have_many(:resumes) }

end
