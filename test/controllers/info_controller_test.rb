require 'test_helper'

class InfoControllerTest < ActionDispatch::IntegrationTest
  test "should get info" do
    get information_url
    assert_response :success
  end

  # test "should output article data" do
  #   get information_url

  #   assigns(:news_articles)

  #   assert true
  # end

end
