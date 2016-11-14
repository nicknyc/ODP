class AddExtidToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :ext_id, :int ,  default: -1
  end
end
