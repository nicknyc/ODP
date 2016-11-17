class Appointment < ApplicationRecord
  serialize :presciption , Array
  belongs_to :patient
  belongs_to :doctor
  belongs_to :schedule
  has_one :physical_record , dependent: :destroy
end
