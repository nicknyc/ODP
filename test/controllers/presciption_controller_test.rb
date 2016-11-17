require 'test_helper'

class prescriptionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prescription_index_url
    assert_response :success
  end

  test "should get show" do
    get prescription_show_url
    assert_response :success
  end

  test "should get new" do
    get prescription_new_url
    assert_response :success
  end

  test "should get edit" do
    get prescription_edit_url
    assert_response :success
  end

end
