class AddColumnToAppointment < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :diagnosis_record, :text
    add_column :appointments, :presciption , :text
  end
end
