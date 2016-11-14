class RegistrationsController < Devise::RegistrationsController
  # Override the action you want here.
  before_filter if: :devise_controller?

  def create
   build_resource(user_params)

   #mine
   resource.user_type = Patient.create(bloodType: params[:bloodType])
   #
   resource.save

   year_id = Time.now.year % 100
   type_id = sprintf '%03d', u.user_type_id
   user_id = sprintf '%03d', u.id

   ext_id = year_id.to_s + type_id + user_id

   

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

  def edit
    @user = resource
    super

  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)



    if current_user.user_type_type == "Patient"
      resource.user_type.update(bloodType: params[:bloodType])
    end


    resource_updated = update_resource(resource, update_user_params)
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      bypass_sign_in resource, scope: resource_name
      respond_with resource, location: after_update_path_for(resource)
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

  def update_user_params
    params.require(:user).permit(:first_name,:last_name,:sex,:national_id,:email,:password,:password_confirmation,:phone_number,:current_password)
  end


end
