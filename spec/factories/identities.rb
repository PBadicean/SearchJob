# == Schema Information
#
# Table name: identities
#
#  id       :integer          not null, primary key
#  user_id  :integer
#  provider :string
#  uid      :string
#
# Indexes
#
#  index_identities_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :identity do
    sequence(:provider) { |n| "my_#{n}_provider" }
    sequence(:uid) { |n| "#{n}_user_uid" }
    user
  end
end
