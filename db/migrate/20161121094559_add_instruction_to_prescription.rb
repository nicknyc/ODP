class AddInstructionToPrescription < ActiveRecord::Migration[5.0]
  def change
    add_column :prescriptions, :instruction , :text
  end
end
