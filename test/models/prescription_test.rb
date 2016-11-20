require 'test_helper'

class PrescriptionTest < ActiveSupport::TestCase
  def setup
    @prescriptions = Prescription.new(appointment_id: 1,med: "aaa",no: 1)
  end

  test "prescription can be nil" do
    @prescriptions = Prescription.new
    assert @prescriptions.valid?
  end

  test "prescription test1 should be valid" do
    assert @prescriptions.valid?
  end

  test "created_at shouldn't be nil" do
    @prescriptions.created_at = nil
    assert_not @prescriptions.valid?
  end

  test "updated_at shouldn't be nil" do
    @prescriptions.updated_at = nil
    assert_not @prescriptions.valid?
  end

  test "appointment_id shouldn't be nil" do
    @prescriptions.appointment_id = nil
    assert_not @prescriptions.valid?
  end

  test "med shouldn't be nil" do
    @prescriptions.med = nil
    assert_not @prescriptions.valid?
  end

  test "no shouldn't be nil" do
    @prescriptions.no = nil
    assert_not @prescriptions.valid?
  end

  test "no shouldn't be zero" do
    @prescriptions.no = 0
    assert_not @prescriptions.valid?
  end

  test "no shouldn't be negative" do
    @prescriptions.no = -1
    assert_not @prescriptions.valid?
  end
end
