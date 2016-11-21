class AddRoleToUsers < ActiveRecord::Migration[5.0]
    def change
        
        add_index :users, [:user_type_type, :user_type_id], :unique => true
        add_index :users, :user_type_type
    end
end
