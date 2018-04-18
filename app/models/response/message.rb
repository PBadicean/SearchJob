# == Schema Information
#
# Table name: response_messages
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  response_id  :integer
#  message_text :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Response::Message < ApplicationRecord

  self.table_name = 'response_messages'
  self.inheritance_column = nil

  validates :message_text, presence: true

  belongs_to :user

end
