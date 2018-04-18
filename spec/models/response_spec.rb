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

require 'rails_helper'

RSpec.describe Response, type: :model do

  it { should belong_to(:vacancy) }
  it { should belong_to(:candidate) }

  it { should validate_presence_of :discription }

end
