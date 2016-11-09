class AddDefaultToAllergy < ActiveRecord::Migration[5.0]
  def change
    change_column :patients, :allergyRecordList, :text , limit: nil
  end
end
