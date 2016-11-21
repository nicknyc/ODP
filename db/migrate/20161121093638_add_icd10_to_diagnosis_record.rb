class AddIcd10ToDiagnosisRecord < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :icd10 , :string
  end
end
