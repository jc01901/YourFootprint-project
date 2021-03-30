require 'test_helper'

class CalculatorControllerTest < ActionDispatch::IntegrationTest
  test "should get calculator" do
    get calculator_calculator_url
    assert_response :success
  end

end
