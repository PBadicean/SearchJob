class AddNameToUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :candidate_info, :name
    remove_column :employer_info, :name
    add_column :users, :name, :string
  end
end
