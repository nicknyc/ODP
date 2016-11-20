class PhysicalRecordsController < ApplicationController
  def index
    @appointments = Appointment.joins(:schedule).where('appointments.status = ?',"Confirmed").where('schedules.date = ?',Date.today).order('schedules.shift ASC')
  end

  def new
    @physical_record = PhysicalRecord.where(appointment_id: params[:id]).first
  end

  def edit
    @physical_record = PhysicalRecord.where(appointment_id: params[:id]).first
  end

  def update
    @physical_record = PhysicalRecord.find(params[:id])
    bloodPressure = params[:SYS] + "/" + params[:DIA]
    @physical_record.bloodPressure = bloodPressure
    @physical_record.save
    respond_to do |format|
      if @physical_record.update(record_params)
        format.html { redirect_to physical_records_path, notice: 'PhysicalRecord was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @physical_record = PhysicalRecord.find(params[:id])
  end

  private
    def record_params
      params.require(:physical_record).permit(:weight,:height,:heartRate)
    end
end
