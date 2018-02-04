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

  enum schedule: { remote: 0, full: 1 }
  enum experience: { no_experience: 0, between_1_and_3: 1, between_3_and_6: 2 }

  validates :name, :salary, :experience, :place_id,
            :discription, :schedule, presence: true

  class << self
    def to_select_experience
      Vacancy.experiences.keys.map { |key| [Vacancy.human_enum_name(:experience, key), key] }
    end
  end

  def error_class_name
    errors.messages[:'place_id'].any? ? 'is-invalid' : ''
  end

end
