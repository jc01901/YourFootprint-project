require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_home_url
    assert_response :success
  end

<<<<<<< HEAD
  test "should get about" do
    get home_about_url
    assert_response :success
  end

=======
>>>>>>> 887ff49460c0954051c8412fb428644c5700567f
end
