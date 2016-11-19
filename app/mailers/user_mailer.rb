class UserMailer < ApplicationMailer
	include Devise::Mailers::Helpers

	default from: 'admin@ODP.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/users/sign_in'
    mail(
      :subject => "test",
      :to => user.email,
			:openssl_verify_mode => 'none'
    )
  end
  def create_appointment_email(user, appointment)
  	@user = user
    @appointment = appointment
    @schedule = appointment.schedule_id
    @doctor = appointment.doctor_id
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Appointment Confirmation Email from ODP')
  end
end
