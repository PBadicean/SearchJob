class CreateVacancies < ActiveRecord::Migration[5.1]
  def change
    create_table :vacancies do |t|
      t.string  :name, null: false
      t.string  :place_id,  index: true, null: false
      t.integer :user_id, index: true, null: false
      t.bigint  :salary, null: false
      t.text    :discription, null: false
      t.integer :schedule, null: false
      t.integer :experience, null: false
      t.string  :key_skills
      t.integer :category_id

      t.timestamps
    end
  end
end
