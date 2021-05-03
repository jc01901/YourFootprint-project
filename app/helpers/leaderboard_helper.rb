module LeaderboardHelper
  def last_seven_days_check(users)
    eligible_users = Array.new
    for user in users do
      # Check if the user has updated their account in the last 7 days
      if user.user_data.order(date: :desc)[0].date > (DateTime.current.midnight - 7)
        eligible_users.push(user)        
      end
    end
    return eligible_users
  end
end
