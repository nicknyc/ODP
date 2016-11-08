require 'test_helper'

class AppointmentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get appointment_index_url
    assert_response :success
  end

  test "should get edit" do
    get appointment_edit_url
    assert_response :success
  end

  test "should get new" do
    get appointment_new_url
    assert_response :success
  end

  test "should get show" do
    get appointment_show_url
    assert_response :success
  end

end
