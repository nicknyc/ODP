class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.text :allergyRecordList, array: true
      t.string :bloodType

      t.timestamps
    end
  end
end
