# == Schema Information
#
# Table name: candidate_info
#
#  id         :integer          not null, primary key
#  name       :string
#  place_id   :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_candidate_info_on_user_id  (user_id)
#

class Candidate::Info < ApplicationRecord

  self.table_name = 'candidate_info'
  self.inheritance_column = nil

  belongs_to :user

  validates :place_id, :name, presence: true

end
