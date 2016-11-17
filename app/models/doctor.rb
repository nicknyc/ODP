class Doctor < ApplicationRecord
  serialize  :schedule, Array
  has_one :user, :as => :user_type
  has_many :schedules , dependent: :destroy
  has_many :appointments
  has_many :patient , :through => :appointments
end
