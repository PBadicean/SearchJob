class AddFieldsToResume < ActiveRecord::Migration[5.1]
  def change
    add_column :resumes, :about_me, :text
    add_column :resumes, :skills, :string
    add_column :resumes, :experience_id, :integer
  end
end
