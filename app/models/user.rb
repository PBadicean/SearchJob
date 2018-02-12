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

class User < ApplicationRecord

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :identities

  enum role: { admin: 0, employer: 1, candidate: 2}
  enum gender: { female: 0, male: 1}

  validates :name, presence: true

  def self.find_for_oauth(auth)
    identity = Identity.find_by(provider: auth.provider, uid: auth.uid.to_s)
    return identity.user if identity

    email = auth.info.email
    user = User.find_by(email: email)
    unless user
      user = Candidate.new(email: email,
                          password: Devise.friendly_token[0, 20],
                          name: auth.info.name)
      user.save!
    end
    user.identities.create!(provider: auth.provider, uid: auth.uid.to_s) if user
    user
  end

end
