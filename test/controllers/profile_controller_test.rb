require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  setup do 
    log_in(User.all[0])
  end

  teardown do
    log_out(User.all[0])
  end
  test "should get profile" do
    get profile_url
    assert_response :success
  end
  
  test "should get change_password" do
    get profile_change_password_url
    assert_response :success
  end

end
