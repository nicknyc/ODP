require 'test_helper'

class DiagnosisRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get diagnosis_record_index_url
    assert_response :success
  end

  test "should get new" do
    get diagnosis_record_new_url
    assert_response :success
  end

  test "should get edit" do
    get diagnosis_record_edit_url
    assert_response :success
  end

  test "should get show" do
    get diagnosis_record_show_url
    assert_response :success
  end

end
