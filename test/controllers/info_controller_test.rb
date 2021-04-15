require 'test_helper'

class InfoControllerTest < ActionDispatch::IntegrationTest
  test "should get info" do
    get info_info_url
    assert_response :success
  end

end
