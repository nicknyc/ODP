class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.integer :doctor_id
      t.integer :shift
      t.date :date
      t.integer :appointment , default: 0
      t.timestamps
    end
  end
end
