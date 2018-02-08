class CreateVacancies < ActiveRecord::Migration[5.1]
  def change
    create_table :vacancies do |t|
      t.string  :name, null: false
      t.string  :place_id, index: true, null: false
      t.integer :user_id, index: true, null: false
      t.integer :salary_min, index: true
      t.integer :salary_max, index: true
      t.text    :discription, null: false
      t.integer :schedule, null: false, index: true
      t.integer :experience, null: false, index: true
      t.string  :key_skills
      t.integer :category_id, index: true

      t.timestamps
    end
  end
end
