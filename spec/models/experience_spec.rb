# == Schema Information
#
# Table name: experiences
#
#  id         :integer          not null, primary key
#  date_start :datetime         not null
#  date_end   :datetime         not null
#  company    :string           not null
#  duty       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Experience, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
