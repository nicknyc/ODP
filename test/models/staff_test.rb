require 'test_helper'

class StaffTest < ActiveSupport::TestCase
  test "staff.yml test1 should be valid" do
    @staff = staffs(:test1)
    assert @staff.valid?
  end

  test "staff.new shouldn't be nil" do
    staff = Staff.new
    assert_not_nil staff
  end

  test "created_at shouldn't be nil" do
    @staff = staffs(:test3)
    assert_not @staff.valid?
  end

  test "updated_at shouldn't be nil" do
    @staff = staffs(:test2)
    assert_not @staff.valid?
  end
end
