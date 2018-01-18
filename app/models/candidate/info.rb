# == Schema Information
#
# Table name: candidate_info
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  place_id   :string           not null
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

  validates :place_id, presence: true

end
