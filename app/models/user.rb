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
    @login || self.ext_id || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["ext_id = :value OR email = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:ext_id) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

end
