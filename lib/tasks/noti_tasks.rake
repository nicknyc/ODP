desc 'send notification email'
task send_noti_email: :environment do
  @appointments = Appointment.joins(:schedule).where('schedules.date = ?',Date.tomorrow)
  @appointments.each do |a|
    UserMailer.notification_email(a).deliver_now
  end
end
