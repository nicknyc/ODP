class AppointmentsController < ApplicationController
  def index
    if current_user.user_type_type == "Patient"
      @appointments = Appointment.where(patient_id: current_user.user_type_id)
    elsif current_user.user_type_type == "Doctor"
      @appointments = Appointment.where(doctor_id: current_user.user_type_id)
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
      @appointment.schedule_id = Schedule.where('shift = ? AND date = ? AND doctor_id = ?',shift,date,params[:appointment][:doctor_id]).first.id
      @appointment.physical_record = PhysicalRecord.new()
    end

    respond_to do |format|
      if x&&@appointment.save
        format.html { redirect_to appointments_path, notice: 'appointment was successfully created.' }
      else
        format.html { redirect_to appointments_path, notice: 'Fail' }
      end
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.schedule = Schedule.find(params[:new_date])
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to appointments_path, notice: 'appointment was successfully updated.' }
      else
        format.html { redirect_to appointments_path, notice: 'Fail' }
      end
    end
  end

  def destroy
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def get_avail
    if params[:pro] != ""
      @avail = Schedule.joins(:doctor).where('schedules.appointment != 20').where('schedules.date>?',Date.today).where('doctors.proficiency = ?', params[:pro]).order('date ASC , shift ASC').pluck(:date)
      @avail_s = Schedule.joins(:doctor).where('schedules.appointment != 20').where('schedules.date>?',Date.today).where('doctors.proficiency = ?', params[:pro]).order('date ASC , shift ASC').pluck(:shift)
    else
      @avail = Schedule.joins(:doctor).where('schedules.appointment != 20').where('schedules.date>?',Date.today).where('doctors.id = ? ', params[:doc]).order('date ASC , shift ASC').pluck(:date)
      @avail_s = Schedule.joins(:doctor).where('schedules.appointment != 20').where('schedules.date>?',Date.today).where('doctors.id = ? ', params[:doc]).order('date ASC , shift ASC').pluck(:shift)
    end
    if request.xhr?
       render :json => {
                           :avail => @avail,
                           :shift => @avail_s
                       }
    end
  end

  private
    def appt_params
      params.require(:appointment).permit(:doctor_id,:patient_id,:symptom)
    end
end
