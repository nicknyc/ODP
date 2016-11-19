class ChangeNationalIdType < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :national_id , :string
  end
end
