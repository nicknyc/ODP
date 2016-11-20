require 'test_helper'

class PrescriptionControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get prescriptions_path
    assert_response :success
  end

  test "should get new" do
    get new_prescription_path
    assert_response :success
  end

  test "should get show" do
    get prescription_path(id: 1)
    assert_response :success
  end

  test "should get edit" do
    patch prescription_path(id: 1)
    assert_response :success
  end

  test "remove_med" do
    assert_response_to()
  end

  test "pres_done" do

  end

end
