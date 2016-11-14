class UsersController < ApplicationController

  def index
    @users = User.all
  end


  def show

  end


  def new
    @user = User.new
  end


  def edit
    @user = User.find(params[:id])
  end


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
    year_id = Time.now.year % 100
    type_id = sprintf '%03d', u.user_type_id
    user_id = sprintf '%03d', u.id

    ext_id = year_id.to_s + type_id + user_id

    

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
      else
        format.html { redirect_to users_path, notice: 'Fail' }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.user_type_type == 'Patient'
      @user.user_type.update(bloodType: params[:bloodType])
    end

    admin_user_params = user_params
    respond_to do |format|
      if @user.update(admin_user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end

  end

  def ban
    @user = User.find(params[:id])
    @user.ban = true
    @user.save
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully banned.' }
      format.json { head :no_content }
    end
  end

  def unban
    @user = User.find(params[:id])
    @user.ban = false
    @user.save
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully unbanned.' }
      format.json { head :no_content }
    end
  end



  private
    def user_params
      params.require(:user).permit(:first_name,:last_name,:sex,:national_id,:email,:password,:password_confirmation,:phone_number)
    end


end
