class AddLatitudeAndLongitudeToVacancyAndCandidate < ActiveRecord::Migration[5.1]
  def change
    add_column :vacancies, :latitude, :float
    add_column :vacancies, :longitude, :float
    add_column :vacancies, :city, :string
    add_column :vacancies, :country, :string
    add_column :candidate_info, :latitude, :float
    add_column :candidate_info, :longitude, :float
    add_column :candidate_info, :city, :string
    add_column :candidate_info, :country, :string
  end
end
