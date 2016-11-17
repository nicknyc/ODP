class AddScheduleIdToAppointment < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :schedule_id , :integer
  end
end
