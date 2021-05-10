class LeaderboardController < ApplicationController
  def leaderboard
    # Create an empty array that will be filled later
    @all_time_leaderboard_users = Array.new
    @weekly_leaderboard_users = Array.new
    # Get all of the users together
    users = User.all.order(lifetime_points: :asc)
    @all_time_leaderboard_users = helpers.last_seven_days_check(users)
    @weekly_leaderboard_users = helpers.weekly_co2e(helpers.last_seven_days_check(users))
  end
end
