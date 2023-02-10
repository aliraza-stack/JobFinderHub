class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.text :required_skills
      t.string :job_type
      t.integer :salary
      t.date :application_deadline
      t.string :company
      t.string :contact
      t.integer :user_id

      t.timestamps
    end
  end
end
