class CreateResumes < ActiveRecord::Migration[5.1]
  def change
    create_table :resumes do |t|
      t.string :position, null: false
      t.integer :salary, null: false
      t.integer :user_id, index: true, null: false
      t.integer :about_me, null: false
      t.references :experience_id, null: false

      t.timestamps
    end
  end
end
