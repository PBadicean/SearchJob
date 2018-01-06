class CreateCategories < ActiveRecord::Migration[5.1]
  def self.up
    create_table :categories do |t|
      t.string      :text
      t.references  :parent
      t.timestamps
    end
  end
end
