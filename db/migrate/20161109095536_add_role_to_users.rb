class AddRoleToUsers < ActiveRecord::Migration[5.0]
  def change
      add_column :users, :user_type_type, :string
    add_column :users, :user_type_id, :integer

    add_index :users, [:user_type_type, :user_type_id], :unique => true
    add_index :users, :user_type_type
  end
end
