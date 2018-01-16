class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.datetime :date_start, null: false
      t.datetime :date_end, null: false
      t.string :company, null: false
      t.string :duty, null: false
      t.references :resume, null: false
    end
  end
end
