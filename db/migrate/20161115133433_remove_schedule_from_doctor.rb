class RemoveScheduleFromDoctor < ActiveRecord::Migration[5.0]
  def change
    remove_column :doctors, :schedule
  end
end
