# == Schema Information
#
# Table name: employer_info
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  company_name :string           not null
#  user_id      :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_employer_info_on_user_id  (user_id)
#

class Employer::Info < ApplicationRecord

  self.table_name = 'employer_info'
  self.inheritance_column = nil

  belongs_to :user

  validates :company_name, presence: true

end
