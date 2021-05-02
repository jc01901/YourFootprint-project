require 'test_helper'

class WeatherControllerTest < ActionDispatch::IntegrationTest
  test "should get weather" do
    get weather_url
    assert_response :success
  end

end
