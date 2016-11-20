# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
<<<<<<< HEAD
	
	def welcome_email
		UserMailer.welcome_email(User.first)
	end
	def create_appointment_email
		UserMailer.create_appointment_email(User.first, Appointment.first)
	end
=======

>>>>>>> origin/feature/front_end
end
