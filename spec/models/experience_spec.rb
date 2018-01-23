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
#  position   :string           not null
#
# Indexes
#
#  index_experiences_on_resume_id  (resume_id)
#

require 'rails_helper'

RSpec.describe Experience, type: :model do

  it { should belong_to(:resume) }

end
