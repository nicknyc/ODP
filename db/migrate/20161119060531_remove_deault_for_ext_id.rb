class RemoveDeaultForExtId < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :ext_id, nil
  end
end
