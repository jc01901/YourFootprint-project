module LeaderboardHelper
  def last_seven_days_check(users)
    eligible_users = Array.new
    for user in users do
      # Check if the user has updated their account in the last 7 days
      if user.user_data.length > 0
        if user.user_data.order(date: :desc)[0].date > (DateTime.current.midnight - 7)
          eligible_users.push(user)     
        end
      end
    end
    return eligible_users
  end
  def weekly_co2e(users) 
    eligible_users = []
    for user in users do
      weekly_points = 0
      all_user_data = user.user_data
      for user_data in all_user_data do 
        if user_data.date > (DateTime.current.midnight - 7)
          weekly_points += user_data.user_points
        end
      end
      if weekly_points == 0 
      else
        eligible_users.push([user, weekly_points])
      end
    end
    eligible_users = eligible_users.sort_by(&:last)
    return eligible_users
  end
end
