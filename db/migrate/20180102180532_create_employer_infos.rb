class CreateEmployerInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :employer_info do |t|
      t.string :name, null: false
      t.string :company_name, null: false
      t.integer :user_id, index: true, null: false

      t.timestamps
    end
  end
end
