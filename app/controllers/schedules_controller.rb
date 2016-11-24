class SchedulesController < ApplicationController
  def index
    if current_user.user_type_type == 'Doctor'
      @users = User.where(first_name: current_user.first_name).paginate(:page => params[:page], :per_page => 10)
    else
      @users = User.where("user_type_type = 'Doctor' && ban = false").order(:first_name).paginate(:page => params[:page], :per_page => 10)
    end
  end

  def new
    @schedule = Schedule.new
    @user = User.where(id: params[:id]).first
  end

  def create
    @schedule = Schedule.new
    doctor_id = params[:schedule][:doctor_id]
    if params[:Date0] != ""
      start_date_0 = Date.strptime(params[:Date0][0..9], "%m/%d/%Y")
      end_date_0 = Date.strptime(params[:Date0][13..22], "%m/%d/%Y")
      shift = params[:Shift0]
      (start_date_0..end_date_0).each do |date|
        if check_unique(doctor_id,date,shift)
          @schedule0 = Schedule.new
          @schedule0.doctor_id = doctor_id
          @schedule0.date = date
          @schedule0.shift = shift
          @schedule0.save
        end
      end
    end
    if params[:Date1] != ""
      start_date_1 = Date.strptime(params[:Date1][0..9], "%m/%d/%Y")
      end_date_1 = Date.strptime(params[:Date1][13..22], "%m/%d/%Y")
      shift = params[:Shift1]
      (start_date_1..end_date_1).each do |date|
        if check_unique(doctor_id,date,shift)
          @schedule1 = Schedule.new
          @schedule1.doctor_id = doctor_id
          @schedule1.date = date
          @schedule1.shift = shift
          @schedule1.save
        end
      end
    end
    if params[:Date2] != ""
      start_date_2 = Date.strptime(params[:Date2][0..9], "%m/%d/%Y")
      end_date_2 = Date.strptime(params[:Date2][13..22], "%m/%d/%Y")
      shift = params[:Shift2]
      (start_date_2..end_date_2).each do |date|
        if check_unique(doctor_id,date,shift)
          @schedule2 = Schedule.new
          @schedule2.doctor_id = doctor_id
          @schedule2.date = date
          @schedule2.shift = shift
          @schedule2.save
        end
      end
    end
    if params[:Date3] != ""
      start_date_3 = Date.strptime(params[:Date3][0..9], "%m/%d/%Y")
      end_date_3 = Date.strptime(params[:Date3][13..22], "%m/%d/%Y")
      shift = params[:Shift3]
      (start_date_3..end_date_3).each do |date|
        if check_unique(doctor_id,date,shift)
          @schedule3 = Schedule.new
          @schedule3.doctor_id = doctor_id
          @schedule3.date = date
          @schedule3.shift = shift
          @schedule3.save
        end
      end
    end
    if params[:Date4] != ""
      start_date_4 = Date.strptime(params[:Date0][0..9], "%m/%d/%Y")
      end_date_4 = Date.strptime(params[:Date0][13..22], "%m/%d/%Y")
      shift = params[:Shift4]
      (start_date_4..end_date_4).each do |date|
        if check_unique(doctor_id,date,shift)
          @schedule4 = Schedule.new
          @schedule4.doctor_id = doctor_id
          @schedule4.date = date
          @schedule4.shift = shift
          @schedule4.save
        end
      end
    end


    respond_to do |format|
      format.html { redirect_to schedules_path, notice: 'Schedule was successfully add.' }
    end

  end

  def edit
    @schedules = Schedule.joins(:doctor => :user).where('users.ban = ? && users.id = ?',false,params[:id]).order('date ASC','shift ASC').paginate(:page => params[:page], :per_page => 10)
    @user = User.find(params[:id])
  end

  def show
    @schedules = Schedule.joins(:doctor => :user).where('users.ban = ? && users.id = ?',false,params[:id]).order('date ASC','shift ASC').paginate(:page => params[:page], :per_page => 10)
  end

  def destroy

  end

  def remove_schedule
    @s = Schedule.find(params[:id])
    @appointments = Appointment.where(schedule_id: params[:id])
    if !@appointments.nil?
      @appointments.each do |a|
        a.schedule = Schedule.where(doctor_id: @s.doctor_id).where('date != ?',@s.date).first
        a.status = 'Pending'
        a.save
        @s.destroy
        UserMailer.remove_schedule_email(a).deliver_now
        uri = URI.parse("https://sms.gipsic.com/api/send")
        Net::HTTP.post_form(uri, {"key" => "x1HGV2MxTO79RK2Ekp74WYR0KLimv94y", "secret" => "3L55iQfLC7Dl0wH1KM42F7JaYWta618l","phone"=>"#{a.patient.user.phone_number}","sender"=>"SMS","message"=>"เวลานัดของคุณถูกเปลี่ยนแปลง #{a.schedule.date} ช่วง #{a.schedule.shift == 0 ? 'เช้า' : 'เย็น'} กับคุณหมอ #{a.doctor.user.first_name} โปรดยืนยันการนัดหมายใหม่ด้วยอีเมลล์ของท่าน หรือเข้าไปเลื่อนหรือยกเลิกนัดได้ในเว็บไซต์ค่ะ"})
      end
    end

    @s.destroy
    respond_to do |format|
        format.json { head :no_content }
    end
  end

  def check_unique(id,date,shift)
    s = Schedule.where(doctor_id: id).where(date: date).where(shift: shift)
    if s == []
      return true
    else
      return false
    end
  end

  private


end
