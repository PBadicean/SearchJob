class AddPositionToExperience < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :position, :string, null:false
  end
end
