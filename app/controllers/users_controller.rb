class UsersController < ApplicationController

  def index
    @users = User.all.order(:user_type_type)
  end


  def show
    @user = User.find(params[:id])

  end


  def new
    @user = User.new
  end


  def edit
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(user_params)

    if params[:Role] == 'admin'
      @user.user_type = Admin.create()
      role_num = 1
    elsif params[:Role] == 'patient'
      @user.user_type = Patient.new(bloodType: params[:bloodType],allergyRecordList: params[:allergyRecordList])
      role_num = 2
    elsif params[:Role] == 'staff'
      @user.user_type = Staff.new()
      role_num = 3
    elsif params[:Role] == 'doctor'
      @user.user_type = Doctor.new(proficiency: params[:proficiency])
      role_num = 4
    elsif params[:Role] == 'nurse'
      @user.user_type = Nurse.new()
      role_num = 5
    else  params[:Role] == 'pharmacist'
      @user.user_type = Pharmacist.new()
      role_num = 6
    end



    respond_to do |format|
      if @user.save
        year_id = Time.now.year % 100
        type_id = sprintf '%03d', @user.user_type_id
        user_id = sprintf '%03d', @user.id
        ext_id = year_id.to_s + role_num.to_s + type_id + user_id
        @user.ext_id = ext_id.to_i

        @user.save
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
      @user.user_type.update(bloodType: params[:bloodType],allergyRecordList: params[:allergyRecordList])
    end

    if @user.user_type_type == 'Doctor'
      @user.user_type.update(proficiency: params[:proficiency])
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

  def patient_list
    if params[:sort].blank?
      @patients = Patient.joins(:appointments => :schedule).where('schedules.date > ?',Date.today)
    else
      if params[:sort] == '1'
        @patients = Patient.all
      else
        @patients = Patient.joins(:appointments => :schedule).where('schedules.date > ?',Date.today)
      end
    end

  end

  def patient_search
    search_query = params[:search].nil? ? "": params[:search]
    @patients = User.where(user_type_type: 'Patient').where('first_name LIKE ? OR last_name LIKE ?',"%"+search_query+"%","%"+search_query+"%")
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

  def autoname
    @users = User.order(:first_name).where(user_type_type: 'Doctor').where('first_name like ? || last_name like ? || ext_id like ?',"%" +params[:term]+ "%","%" +params[:term]+ "%","%" +params[:term]+ "%")
    render json: @users.map{|u| {label: u.first_name + " " + u.last_name ,value: u.user_type_id}}
  end

  def autopat
    @users = User.order(:first_name).where(user_type_type: 'Patient').where('first_name like ? || last_name like ? || ext_id like ?',"%" +params[:term]+ "%","%" +params[:term]+ "%","%" +params[:term]+ "%")
    render json: @users.map{|u| {label: u.first_name + " " + u.last_name ,value: u.user_type_id}}
  end

  def autopro
    @proficiencies = Doctor.where('proficiency like ?',"%" +params[:term]+ "%").pluck(:proficiency)
    render json: @proficiencies.map{|u| {label: u ,value: u}}
  end



  private
    def user_params
      params.require(:user).permit(:first_name,:last_name,:sex,:national_id,:email,:password,:password_confirmation,:phone_number)
    end


end
