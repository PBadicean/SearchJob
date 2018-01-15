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
#
# Indexes
#
#  index_resumes_on_category_id  (category_id)
#  index_resumes_on_user_id      (user_id)
#

class Resume < ApplicationRecord

  belongs_to :user
  belongs_to :category
  has_many :experiences

  accepts_nested_attributes_for :experiences, reject_if: :all_blank, allow_destroy: true

  validates :position, :salary, :about_me, presence: true

end
