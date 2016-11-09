class CreatePharmacists < ActiveRecord::Migration[5.0]
  def change
    create_table :pharmacists do |t|
      t.timestamps
    end
  end
end
