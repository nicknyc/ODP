class AddAppointmentIdToPhysicalRecord < ActiveRecord::Migration[5.0]
  def change
    add_column :physical_records, :appointment_id , :integer
  end
end
