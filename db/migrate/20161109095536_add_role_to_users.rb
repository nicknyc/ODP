class AddRoleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_type_type, "ENUM('Admin','Patient','Staff','Doctor','Nurse','Pharmacist')" ,  null: false
    add_column :users, :user_type_id, :integer, :null => false

    add_index :users, [:user_type_type, :user_type_id], :unique => true
    add_index :users, :user_type_type
  end
end
