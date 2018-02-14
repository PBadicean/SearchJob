class CreateResponseMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :response_messages do |t|
      t.integer :user_id
      t.integer :response_id
      t.string :message_text

      t.timestamps
    end
  end
end
