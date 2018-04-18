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

require 'rails_helper'

RSpec.describe Resume, type: :model do

  it { should have_many(:experiences) }

  it { should belong_to(:candidate) }
  it { should belong_to(:category) }

  it { should validate_presence_of :tags }
  it { should validate_presence_of :about_me }
  it { should validate_presence_of :salary }
  it { should validate_presence_of :position }

end
