require 'test_helper'

class PresciptionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get presciption_index_url
    assert_response :success
  end

  test "should get show" do
    get presciption_show_url
    assert_response :success
  end

  test "should get new" do
    get presciption_new_url
    assert_response :success
  end

  test "should get edit" do
    get presciption_edit_url
    assert_response :success
  end

end
