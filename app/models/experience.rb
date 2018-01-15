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
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_experiences_on_resume_id  (resume_id)
#

class Experience < ApplicationRecord

  has_many :resumes

end
