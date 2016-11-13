class UsersController < ApplicationController

  def index
    @users = User.all
  end


  def show

  end


  def new
    @user = User.new
  end


  # def edit
  #
  # end


  def create
    @user = User.new(user_params)


    if params[:Role] == 'Admin'
      @user.user_type = Admin.create()
    elsif params[:Role] == 'Patient'
      @user.user_type = Patient.new(bloodType: params[:bloodType])
    elsif params[:Role] == 'Staff'
      @user.user_type = Staff.new()
    elsif params[:Role] == 'Doctor'
      @user.user_type = Doctor.new()
    elsif params[:Role] == 'Nurse'
      @user.user_type = Nurse.new()
    else  params[:Role] == 'Pharmacist'
      @user.user_type = Pharmacist.new()
    end
    @user.save
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
      else
        raise
        format.html { redirect_to users_path, notice: 'Fail' }
      end
    end
  end


  # def update
  #
  # end
  #
  # def destroy
  #
  # end
  #
  # def undelete
  #
  # end



  private
    def user_params
      params.require(:user).permit(:first_name,:last_name,:sex,:national_id,:email,:password,:password_confirmation,:phone_number)
    end


end
