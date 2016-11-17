class RemovePrescriptionAttrFromAppointment < ActiveRecord::Migration[5.0]
  def change
    remove_column :appointments, :presciption
  end
end
