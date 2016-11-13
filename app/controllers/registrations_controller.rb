class RegistrationsController < Devise::RegistrationsController
  # Override the action you want here.
  before_filter if: :devise_controller?

  def create
   build_resource(user_params)
   resource.user_type = Patient.create(bloodType: params[:user][:patients][:bloodType])
   resource.save
   yield resource if block_given?
   if resource.persisted?
     if resource.active_for_authentication?
       set_flash_message! :notice, :signed_up
       sign_up(resource_name, resource)
       respond_with resource, location: after_sign_up_path_for(resource)
     else
       set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
       expire_data_after_sign_in!
       respond_with resource, location: after_inactive_sign_up_path_for(resource)
     end
   else
     clean_up_passwords resource
     set_minimum_password_length
     respond_with resource
   end
  end

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:sex,:national_id,:email,:password,:password_confirmation,:phone_number)
  end


end
