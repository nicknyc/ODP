require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  def setup
    @appointment = Appointment.new(doctor_id: 1,patient_id: 1,symptom: "headache")
  end

  test "setup should be valid" do
    assert @appointment.valid?
  end

  test "symptom shouldn't be nil" do
    @appointment.symptom = nil
    assert_not @appointment.valid?
  end

  test "doctor_id shouldn't be nil" do
    @appointment.doctor_id = nil
    assert_not @appointment.valid?
  end

  test "patient_id shouldn't be nil" do
    @appointment.patient_id = nil
    assert_not @appointment.valid?
  end

end
