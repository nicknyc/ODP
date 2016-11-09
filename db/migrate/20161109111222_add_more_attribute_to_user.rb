class AddMoreAttributeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :national_id, :integer, null: false
    add_column :users, :sex, "ENUM('M','F')", null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :phone_number, :integer, null: false
  end
end
