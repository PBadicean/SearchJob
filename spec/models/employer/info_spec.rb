# == Schema Information
#
# Table name: employer_info
#
#  id           :integer          not null, primary key
#  name         :string
#  company_name :string
#  user_id      :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_employer_info_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Employer::Info, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
