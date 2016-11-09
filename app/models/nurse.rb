class Nurse < ApplicationRecord
  has_one :user, :as => :user_type
end
