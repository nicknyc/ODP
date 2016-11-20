require 'test_helper'

class PhysicalRecordTest < ActiveSupport::TestCase

  def setup
    @appointment = Appointment.new(doctor_id: 1,patient_id: 1,symptom: "headache")
  end

  test "nil record should be valid" do
    assert_nil @appointment.physical_record
  end

  test "should be valid" do
    @appointment.physical_record = physical_records(:test1)
    assert_not_nil @appointment.physical_record.valid?
    assert @appointment.physical_record.valid?
  end
end
