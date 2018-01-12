# == Schema Information
#
# Table name: resumes
#
#  id               :integer          not null, primary key
#  position         :string           not null
#  salary           :integer          not null
#  user_id          :integer          not null
#  about_me         :integer          not null
#  experience_id_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_resumes_on_experience_id_id  (experience_id_id)
#  index_resumes_on_user_id           (user_id)
#

class Resume < ApplicationRecord

  belongs_to :user
  belongs_to :category
  belongs_to :experience

  accepts_nested_attributes_for :experience

end
