require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  test "schedule.yml test1 should be valid" do
    @schedule = schedules(:test1)
    assert @schedule.valid?
  end

  test "schedule.new shouldn't be nil" do
    schedule = Schedule.new
    assert_not_nil schedule
  end

  test "created_at shouldn't be nil" do
    @schedule = schedules(:test3)
    assert_not @schedule.valid?
  end

  test "updated_at shouldn't be nil" do
    @schedule = schedules(:test2)
    assert_not @schedule.valid?
  end

  test "no_doctor_id shouldn't be valid" do
    @schedule = schedules(:no_doctor_id)
    assert_not @schedule.valid?
  end

  test "no_shift shouldn't be valid" do
    @schedule = schedules(:no_shift)
    assert_not @schedule.valid?
  end

  test "no_date shouldn't be valid" do
    @schedule = schedules(:no_date)
    assert_not @schedule.valid?
  end

  test "appointment shouldn't be nil" do
    @schedule = schedules(:no_appointment)
    assert_not @schedule.valid?
  end

  test "negative_appointment shouldn't be valid" do
    @schedule = schedules(:negative_appointment)
    assert_not @schedule.valid?
  end

  test "char_appointment shouldn't be valid" do
    @schedule = schedules(:char_appointment)
    assert_not @schedule.valid?
  end
end
