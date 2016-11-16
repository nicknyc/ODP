class Appointment < ApplicationRecord
  serialize :persciption , Array
  has_one :patient
  has_one :doctor
  has_one :physical_record , dependent: :destroy
end
