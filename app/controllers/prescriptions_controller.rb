class PrescriptionsController < ApplicationController
  def index
    @appointments = Appointment.joins(:schedule).where('appointments.status = "Done" OR appointments.status = "Finished"').where('schedules.date >= ?',Date.today).order('schedules.shift ASC')
  end

  def show
    @appointment = Appointment.find(params[:id])
    @prescriptions = Prescription.where(appointment_id: params[:id])
  end

  def new
  end

  def edit
  end

  def remove_med
    Prescription.find(params[:id]).delete
    respond_to do |format|
        format.json { head :no_content }
    end
  end


  def pres_done
    a = Appointment.find(params[:id])
    a.status = "Finished"
    a.save
    respond_to do |format|
        format.html { redirect_to prescriptions_path, notice: 'Med prescribed' }
    end
  end

end
