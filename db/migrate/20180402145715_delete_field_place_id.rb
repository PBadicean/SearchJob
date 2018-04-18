class DeleteFieldPlaceId < ActiveRecord::Migration[5.1]
  def change
    remove_column :candidate_info, :place_id
    remove_column :vacancies, :place_id
  end
end
