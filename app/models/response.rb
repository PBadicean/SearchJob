# == Schema Information
#
# Table name: responses
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  vacancy_id  :integer          not null
#  discription :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Response < ApplicationRecord

  belongs_to :vacancy
  belongs_to :candidate, class_name: 'Candidate', foreign_key: :user_id

  validates :discription, presence: true

end
