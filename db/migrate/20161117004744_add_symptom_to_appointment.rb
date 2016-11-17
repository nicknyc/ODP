class AddSymptomToAppointment < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :symptom , :text
  end
end
