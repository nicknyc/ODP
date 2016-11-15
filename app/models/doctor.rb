class Doctor < ApplicationRecord
  serialize  :schedule, Array
  has_one :user, :as => :user_type
  has_many :schedules
end
