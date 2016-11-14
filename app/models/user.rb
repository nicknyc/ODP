class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :user_type, :polymorphic => true

  def login=(login)
    @login = login
  end

  def login
    @login || self.ext_id || self.email || self.national_id
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["ext_id = :value OR email = :value OR national_id = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:ext_id) || conditions.has_key?(:email) || conditions.has_key?(:national_id)
      where(conditions.to_h).first
    end
  end

end
