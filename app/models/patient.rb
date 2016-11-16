class Patient < ApplicationRecord
  serialize :allergyRecordList,Array
  has_one :user, :as => :user_type
  has_many :appointments
end
