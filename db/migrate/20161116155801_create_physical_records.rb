class CreatePhysicalRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :physical_records do |t|
      t.integer :weight
      t.integer :height
      t.string :bloodPressure
      t.integer :heartRate
      t.timestamps
    end
  end
end
