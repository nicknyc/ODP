class AddBanToUsers < ActiveRecord::Migration[5.0]
  def change
      add_column :users, :ban, :boolean ,  null: false , default: false
  end
end
