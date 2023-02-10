class AddInfoInUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :father_name, :string
    add_column :users, :cnic, :string
    add_column :users, :dob, :date
    add_column :users, :description, :text
    add_column :users, :skill, :string
  end
end
