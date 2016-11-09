class Patient < ApplicationRecord
  serialize :allergyRecordList,Array
  has_one :user, :as => :user_type
end
