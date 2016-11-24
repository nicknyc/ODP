class AppointmentsController < ApplicationController
  require "net/http"
  require "uri"
  def index
    if current_user.user_type_type == "Patient"
      @appointments = Appointment.where(patient_id: current_user.user_type_id).joins(:schedule).order('schedules.date ASC')
    elsif current_user.user_type_type == "Doctor"
      @appointments = Appointment.where(doctor_id: current_user.user_type_id).joins(:schedule).order('schedules.date ASC')
    elsif current_user.user_type_type == "Staff"
      @appointments = Appointment.joins(:schedule).order('schedules.date ASC')
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
    @avail = Schedule.joins(:doctor).where('schedules.id != ?',@appointment.schedule.id).where('schedules.appointment != 20').where('schedules.date>?',Date.today).where('doctors.id = ? ', 3).order('date ASC , shift ASC')
    @availarray = @avail.map{ |a| [a.date.to_s + (a.shift==0 ? " : เช้า" : " : เย็น") , a.id ] }
  end

  def new
    @appointment =  Appointment.new
  end

  def create
    @appointment = Appointment.new(appt_params)

    x = true
    if params[:appointment_date] == "ไม่มีเวลาที่ใช้ได้"
      x = false
    else
      if params[:appointment_date][0..3] == "เช้า"
        shift = 0
      else
      shift = 1
      end


      date =  params[:appointment_date][6..15].to_date
      if params[:pro_names].blank?
        @appointment.schedule_id = Schedule.where('appointment != 20').where('shift = ? AND date = ? AND doctor_id = ?',shift,date,params[:appointment][:doctor_id]).first.id
        @schedule = Schedule.where('appointment != 20').where('shift = ? AND date = ? AND doctor_id = ?',shift,date,params[:appointment][:doctor_id]).first
      else
        @appointment.doctor_id = Schedule.joins(:doctor).where('schedules.appointment != 20').where('doctors.proficiency = ?',params[:pro_names]).where('schedules.shift = ? AND schedules.date = ? ',shift,date).first.doctor_id
        @schedule = Schedule.joins(:doctor).where('schedules.appointment != 20').where('doctors.proficiency = ?',params[:pro_names]).where('schedules.shift = ? AND schedules.date = ? ',shift,date).first
        @appointment.schedule_id = @schedule.id
      end
      @appointment.physical_record = PhysicalRecord.new()
    end

    respond_to do |format|
      if x&&check_unique_app(params[:appointment][:doctor_id],params[:appointment][:patient_id],@schedule.id)
        @appointment.save
        @user = Patient.find(params[:appointment][:patient_id]).user
        UserMailer.create_appointment_email(@user,@appointment).deliver_now
        uri = URI.parse("https://sms.gipsic.com/api/send")
        Net::HTTP.post_form(uri, {"key" => "x1HGV2MxTO79RK2Ekp74WYR0KLimv94y", "secret" => "3L55iQfLC7Dl0wH1KM42F7JaYWta618l","phone"=>"#{@user.phone_number}","sender"=>"SMS","message"=>"วันนัดของคุณคือวัน #{@appointment.schedule.date} ช่วง #{params[:appointment_date][0..3]} กับคุณหมอ #{@appointment.doctor.user.first_name} โปรดยืนยันการนัดหมายนี้ด้วยอีเมลล์ของท่านค่ะ"})
        format.html { redirect_to appointments_path, notice: 'appointment was successfully created.' }
      else
        format.html { redirect_to appointments_path, error: 'มีนัดหมายในเวลานี้อยู่แล้ว' }
      end
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    if params[:new_date] == nil
      @appointment.diagnosis_record = params[:appointment][:diagnosis_record]
      if params[:med0] != ""
        if check_unique(params[:id],params[:med0],params[:no0])
          @p0 = Prescription.new
          @p0.appointment_id = params[:id]
          @p0.med = params[:med0]
          @p0.no = params[:no0]
          @p0.instruction = params[:in0]
          @p0.save
        end
      end
      if params[:med1] != ""
        if check_unique(params[:id],params[:med1],params[:no1])
          @p1 = Prescription.new
          @p1.appointment_id = params[:id]
          @p1.med = params[:med1]
          @p1.no = params[:no1]
          @p1.instruction = params[:in1]
          @p1.save
        end
      end
      if params[:med2] != ""
        if check_unique(params[:id],params[:med2],params[:no2])
          @p2 = Prescription.new
          @p2.appointment_id = params[:id]
          @p2.med = params[:med2]
          @p2.no = params[:no2]
          @p2.instruction = params[:in2]
          @p2.save
        end
      end
      if params[:med3] != ""
        if check_unique(params[:id],params[:med3],params[:no3])
          @p3 = Prescription.new
          @p3.appointment_id = params[:id]
          @p3.med = params[:med3]
          @p3.no = params[:no3]
          @p3.instruction = params[:in3]
          @p3.save
        end
      end
      if params[:med4] != ""
        if check_unique(params[:id],params[:med4],params[:no4])
          @p4 = Prescription.new
          @p4.appointment_id = params[:id]
          @p4.med = params[:med4]
          @p4.no = params[:no4]
          @p4.instruction = params[:in4]
          @p4.save
        end
      end
      if @appointment.status != 'Done'
        @appointment.status = 'Done'
      end
      repath = diagnosis_records_path
    else
      @appointment.schedule = Schedule.find(params[:new_date])
      repath = appointments_path
    end
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to repath, notice: 'appointment was successfully updated.' }
      else
        format.html { redirect_to repath, notice: 'Fail' }
      end
    end
  end

  def destroy
    if Appointment.find(params[:id]).status == 'Confirmed'
      @schedule = Appointment.find(params[:id]).schedule
      @schedule.appointment -= 1
    end
    respond_to do |format|
      if Appointment.find(params[:id]).destroy
        format.html { redirect_to appointments_path, notice: 'appointment was successfully destroyed.' }
      else
        format.html { redirect_to appointments_path, notice: 'Fail' }
      end
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    @prescriptions = Prescription.where(appointment_id: params[:id])
  end

  def confirm_appointment
    @appointment = Appointment.find(params[:id])
    @appointment.status = 'Confirmed'
    @appointment.save
    @schedule = @appointment.schedule
    @schedule.appointment = @schedule.appointment + 1
    @schedule.save
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'ยืนยันการนัดแล้ว' }
    end
  end

  def get_avail
    if params[:pro] != ""
      @avail = Schedule.joins(:doctor).where('schedules.appointment != 20').where('schedules.date>=?',Date.today).where('doctors.proficiency = ?', params[:pro]).order('date ASC , shift ASC').pluck(:date)
      @avail_s = Schedule.joins(:doctor).where('schedules.appointment != 20').where('schedules.date>=?',Date.today).where('doctors.proficiency = ?', params[:pro]).order('date ASC , shift ASC').pluck(:shift)
    else
      @avail = Schedule.joins(:doctor).where('schedules.appointment != 20').where('schedules.date>=?',Date.today).where('doctors.id = ? ', params[:doc]).order('date ASC , shift ASC').pluck(:date)
      @avail_s = Schedule.joins(:doctor).where('schedules.appointment != 20').where('schedules.date>=?',Date.today).where('doctors.id = ? ', params[:doc]).order('date ASC , shift ASC').pluck(:shift)
    end
    if request.xhr?
       render :json => {
                           :avail => @avail,
                           :shift => @avail_s
                       }
    end
  end

  def check_unique(id,med,no)
    s = Prescription.where(appointment_id: id).where(med: med).where(no: no)
    if s == []
      return true
    else
      return false
    end
  end

  def check_unique_app(doctor_id,patient_id,schedule_id)
    a = Appointment.where(doctor_id: doctor_id).where(patient_id: patient_id).where(schedule_id: schedule_id)
    if a == []
      return true
    else
      return false
    end
  end

  private
    def appt_params
      params.require(:appointment).permit(:doctor_id,:patient_id,:symptom)
    end
    def diagnosis_params
      params.require(:appointment).permit(:diagnosis_record)
    end
end
