class DiagnosisRecordsController < ApplicationController
  def index
    @appointments = Appointment.joins(:schedule).where('appointments.status = "Recorded" ').where('schedules.date >= ?',Date.today).order('schedules.shift ASC')
  end

  def new
    @appointment = Appointment.find(params[:id])
    @prescriptions = Prescription.where(appointment_id: params[:id])
  end

  def edit
    @appointment = Appointment.find(params[:id])
    @prescriptions = Prescription.where(appointment_id: params[:id])
  end

  def update

  end

  def show
    @appointment = Appointment.find(params[:id])
    @prescriptions = Prescription.where(appointment_id: params[:id])
  end



end
