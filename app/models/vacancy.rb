# == Schema Information
#
# Table name: vacancies
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  place_id    :string           not null
#  user_id     :integer          not null
#  salary      :integer          not null
#  discription :text             not null
#  schedule    :integer          not null
#  experience  :integer          not null
#  key_skills  :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_vacancies_on_place_id  (place_id)
#  index_vacancies_on_user_id   (user_id)
#

class Vacancy < ApplicationRecord

  include Shared::Place

  enum schedule: { remote: 0, full: 1 }
  enum experience: { 'None' => 0, '1-3 years' => 1, '3-6 years' => 2 }

  validates :name, :salary, :experience, :place_id,
            :discription, :schedule, presence: true

end
