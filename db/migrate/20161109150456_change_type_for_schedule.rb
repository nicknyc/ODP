class ChangeTypeForSchedule < ActiveRecord::Migration[5.0]
  def change
    change_column :doctors, :schedule, :text 
  end
end
