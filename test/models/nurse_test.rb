require 'test_helper'

class NurseTest < ActiveSupport::TestCase
  test "nurse.yml test1 should be valid" do
    @nurse = nurses(:test1)
    assert @nurse.valid?
  end

  test "nurse.new shouldn't be nil" do
    nurse = Nurse.new
    assert_not_nil nurse
  end

  test "created_at shouldn't be nil" do
    @nurse = nurses(:test3)
    assert_not @nurse.valid?
  end

  test "updated_at shouldn't be nil" do
    @nurse = nurses(:test2)
    assert_not @nurse.valid?
  end
end
