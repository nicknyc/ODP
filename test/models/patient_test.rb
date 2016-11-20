require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  test "patient.yml test1 should be valid" do
    @patient = patients(:test1)
    assert @patient.valid?
  end

  test "patient.new shouldn't be nil" do
    patient = Patient.new
    assert_not_nil patient
  end

  test "created_at shouldn't be nil" do
    @patient = patients(:test3)
    assert_not @patient.valid?
  end

  test "updated_at shouldn't be nil" do
    @patient = patients(:test2)
    assert_not @patient.valid?
  end

  test "allergyRecordList can be nil" do
    @patient = patients(:test4)
    assert @patient.valid?
  end

  test "bloodType shouldn't be nil" do
    @patient = patients(:test5)
    assert_not @patient.valid?
  end

  test "bloodType shouldn't be number" do
    @patient = patients(:test5)
    @patient.bloodType = 123
    assert_not @patient.valid?
  end
end
