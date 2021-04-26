class LeaderboardController < ApplicationController
  def leaderboard
    # Create an empty array that will be filled later
    @all_time_leaderboard_users = Array.new
    # Get all of the users together
    users = User.all
    user_data = UserData.all
    for user in users do
      # Check if the user has updated their account in the last 7 days
      if user_data.where(user_id: user.id).order(created_at :desc)[0].created_at > (DateTime.current.midnight - 7)
        # If updated in the last 7 days add them to the users to be displayed  
        @all_time_leaderboard_users.push(user)
      end
    end
    # Sort the users to be shown by their lifetime user points
    @all_time_leaderboard_users.sort_by { |user| user.lifetime_user_points}

  end
end
