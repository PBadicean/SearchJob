# == Schema Information
#
# Table name: candidate_info
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  latitude   :float
#  longitude  :float
#  city       :string
#  country    :string
#
# Indexes
#
#  index_candidate_info_on_user_id  (user_id)
#

class Candidate::Info < ApplicationRecord

  self.table_name = 'candidate_info'
  self.inheritance_column = nil

  belongs_to :user

  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.city    = geo.city
      obj.country = geo.country
    end
  end
  after_validation :reverse_geocode

end
