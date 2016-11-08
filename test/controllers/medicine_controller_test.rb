require 'test_helper'

class MedicineControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get medicine_index_url
    assert_response :success
  end

  test "should get show" do
    get medicine_show_url
    assert_response :success
  end

  test "should get edit" do
    get medicine_edit_url
    assert_response :success
  end

  test "should get new" do
    get medicine_new_url
    assert_response :success
  end

end
