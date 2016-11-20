require 'test_helper'

class PharmacistTest < ActiveSupport::TestCase
  test "pharmacist.yml test1 should be valid" do
    @pharmacist = pharmacists(:test1)
    assert @pharmacist.valid?
  end

  test "pharmacist.new shouldn't be nil" do
    pharmacist = Pharmacist.new
    assert_not_nil pharmacist
  end

  test "created_at shouldn't be nil" do
    @pharmacist = pharmacists(:test3)
    assert_not @pharmacist.valid?
  end

  test "updated_at shouldn't be nil" do
    @pharmacist = pharmacists(:test2)
    assert_not @pharmacist.valid?
  end
end
