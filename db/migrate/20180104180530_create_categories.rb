class CreateCategories < ActiveRecord::Migration[5.1]
  def self.up
    create_table :categories do |t|
      t.string      :name
      t.references  :parent
    end
  end
end
