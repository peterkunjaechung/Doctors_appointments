class AppointmentsController < ApplicationController
  before_action :set_patient

  def index
    @physicians = @patient.appointments.where(role: 'physician')
    @nurses = @patient.appointments.where(role: 'nurse')
    @subjects = @patient.appointments.where(role: 'subject')
  end

  def new
    @doctors = Doctor.all - @patient.doctors
    @appointment = @patient.appointments.new
  end

  def create
    @appointment = @patient.appointments.new(appointment_params)
    if @appointment.save
      redirect_to patient_appointments_path(@patient)
    else
      render :new
    end
  end

  def destroy
    @appointment = @patient.appointments.find(params[:id])
    @appointment.destroy
    redirect_to patient_appointments_path(@patient)
  end

 private
   def set_patient
     @patient = Patient.find(params[:patient_id]) 
   end

   def appointment_params
     params.require(:appointment).permit(:role, :user_id)
   end
end

