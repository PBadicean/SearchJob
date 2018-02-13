class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.integer :user_id, null: false
      t.integer :vacancy_id, null: false
      t.text    :discription

      t.timestamps
    end
  end
end
