require 'test_helper'

class PhysicalRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get physical_record_index_url
    assert_response :success
  end

  test "should get new" do
    get physical_record_new_url
    assert_response :success
  end

  test "should get edit" do
    get physical_record_edit_url
    assert_response :success
  end

  test "should get show" do
    get physical_record_show_url
    assert_response :success
  end

end
