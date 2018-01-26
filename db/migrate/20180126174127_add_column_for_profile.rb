class AddColumnForProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :avatar, :string
    add_column :users, :birthday, :date
    add_column :users, :gender, :integer
  end
end
