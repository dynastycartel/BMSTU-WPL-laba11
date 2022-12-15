require "test_helper"

class CalcControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get calc_input_url
    assert_response :success
  end

  test "should get output" do
    get calc_output_url
    assert_response :success
  end

  test "should get db_check_input" do
    get calc_db_check_input_url
    assert_response :success
  end

  test "should get db_check_output" do
    get calc_db_check_output_url
    assert_response :success
  end
end
