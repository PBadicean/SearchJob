class CreateEmployerInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :employer_info do |t|
      t.string :name
      t.string :company_name
      t.integer :user_id, index: true, null: false

      t.timestamps
    end
  end
end
