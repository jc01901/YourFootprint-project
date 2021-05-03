require 'test_helper'

class LeaderboardControllerTest < ActionDispatch::IntegrationTest
  test "should get leaderboard" do
    get leaderboard_url
    assert_response :success
  end

end
