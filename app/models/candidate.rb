# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :integer
#  name                   :string
#  avatar                 :string
#  birthday               :date
#  gender                 :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_role                  (role)
#

class Candidate < User

  include Shared::Roles

  has_one :info,
           foreign_key: :user_id,
           class_name: 'Candidate::Info',
           inverse_of: :user,
           dependent: :destroy

  has_many :resumes,
            foreign_key: :user_id,
            dependent: :destroy

  has_many :responses,
            foreign_key: :user_id,
            dependent: :destroy

  accepts_nested_attributes_for :info

  default_scope { candidate }

  def error_class_name
    errors.messages[:'info.place_id'].any? ? 'is-invalid' : ''
  end

end
