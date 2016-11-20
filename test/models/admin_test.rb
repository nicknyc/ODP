require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  test "admin.yml test1 should be valid" do
    @admin = admins(:test1)
    assert @admin.valid?
  end

  test "Admin.new shouldn't be nil" do
    admin = Admin.new
    assert_not_nil admin
  end

  test "created_at shouldn't be nil" do
    @admin = admins(:test3)
    assert_not @admin.valid?
  end

  test "updated_at shouldn't be nil" do
    @admin = admins(:test2)
    assert_not @admin.valid?
  end
end
