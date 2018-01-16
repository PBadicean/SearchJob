# == Schema Information
#
# Table name: experiences
#
#  id         :integer          not null, primary key
#  date_start :datetime         not null
#  date_end   :datetime         not null
#  company    :string           not null
#  duty       :string           not null
#  resume_id  :integer          not null
#
# Indexes
#
#  index_experiences_on_resume_id  (resume_id)
#

class Experience < ApplicationRecord

  belongs_to :resume

  validates :date_start, :date_end, :duty, :company, presence: true

end
