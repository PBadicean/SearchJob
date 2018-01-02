class CreateCandidateInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :candidate_info do |t|
      t.string :name
      t.string :place_id
      t.integer :user_id, index: true, null: false

      t.timestamps
    end
  end
end
