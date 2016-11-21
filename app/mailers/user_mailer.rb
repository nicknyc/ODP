class UserMailer < ApplicationMailer
<<<<<<< HEAD
	default from: 'benzbeeblover@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
=======
	include Devise::Mailers::Helpers

	default from: 'admin@ODP.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/users/sign_in'
    mail(
      :subject => "WELCOME FROM ODP!",
      :to => user.email,
			:openssl_verify_mode => 'none'
    )
>>>>>>> origin/feature/front_end
  end
  def create_appointment_email(user, appointment)
  	@user = user
    @appointment = appointment
    @schedule = appointment.schedule_id
    @doctor = appointment.doctor_id
<<<<<<< HEAD
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Appointment Confirmation Email from ODP')
=======
    @url  = 'http://localhost:3000/confirm_appointment?id='+appointment.id.to_s
    mail(to: user.email, subject: 'Appointment Confirmation Email from ODP')
>>>>>>> origin/feature/front_end
  end

	def notification_email(appointment)
  	@user = appointment.patient.user
		@appointment = appointment
    mail(to: @user.email, subject: 'Appointment Notification Email from ODP')
  end

	def remove_schedule_email(appointment)
		@user = appointment.patient.user
		@appointment = appointment
		@url  = 'http://localhost:3000/confirm_appointment?id='+appointment.id.to_s
		mail(to: @user.email, subject: 'Appointment Changes Email from ODP')
	end
end
