class AddColumnToVacancy < ActiveRecord::Migration[5.1]
  def change
    remove_column :vacancies, :salary
    add_column :vacancies, :salary_start, :integer
    add_column :vacancies, :salary_end, :integer
  end
end
