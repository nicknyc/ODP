class AddMoreAttributeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :national_id, :integer
    add_column :users, :sex, :char
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :integer
  end
end
