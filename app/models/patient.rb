class Patient < ApplicationRecord
  has_one :user, :as => :user_type
  has_many :appointments
  has_many :doctor , :through => :appointments
end
