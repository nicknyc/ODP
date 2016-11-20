class ApplicationController < ActionController::Base
  layout 'admin_lte_2'

  protect_from_forgery with: :exception
  before_filter :banned?
  before_action :configure_permitted_parameters, if: :devise_controller?

 def banned?
   if current_user.present? && current_user.ban?
     sign_out current_user
     flash[:error] = "This account has been suspended"
     root_path
   end
 end

 protected

  def configure_permitted_parameters
    added_attrs = [:ext_id, :email, :national_id, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
