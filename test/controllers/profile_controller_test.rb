require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get profile_url
    assert_response :success
  end

  test "should get edit" do
    get profile_edit_url
    assert_response :success
  end

  test "should get change_password" do
    get profile_change_password_url
    assert_response :success
  end

end
