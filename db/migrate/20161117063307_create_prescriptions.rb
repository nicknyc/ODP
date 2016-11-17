class CreatePrescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :prescriptions do |t|
      t.integer :appointment_id
      t.string :med
      t.integer :no
      t.timestamps
    end
  end
end
