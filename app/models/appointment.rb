class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  belongs_to :schedule
  has_one :physical_record , dependent: :destroy
  has_many :prescription , dependent: :destroy
end
