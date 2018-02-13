# == Schema Information
#
# Table name: vacancies
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  place_id    :string           not null
#  user_id     :integer          not null
#  salary_min  :integer
#  salary_max  :integer
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
#  index_vacancies_on_category_id  (category_id)
#  index_vacancies_on_experience   (experience)
#  index_vacancies_on_place_id     (place_id)
#  index_vacancies_on_salary_max   (salary_max)
#  index_vacancies_on_salary_min   (salary_min)
#  index_vacancies_on_schedule     (schedule)
#  index_vacancies_on_user_id      (user_id)
#

class Vacancy < ApplicationRecord

  belongs_to :employer, class_name: 'Employer', foreign_key: :user_id
  belongs_to :category
  has_many :responses

  delegate :info, to: :employer

  enum schedule: { remote: 0, full: 1 }
  enum experience: { no_experience: 0, between_1_and_3: 1, between_3_and_6: 2 }

  validates :name, :salary_min, :salary_max, :experience,
            :discription, :schedule, presence: true

  def error_class_name
    errors.messages[:place_id].any? ? 'is-invalid' : ''
  end

  def split_skills
    key_skills.split(',')
  end

  class << self
    def to_select_experience
      Vacancy.experiences.keys.map { |key| [Vacancy.human_enum_name(:experience, key), key] }
    end
  end

end
