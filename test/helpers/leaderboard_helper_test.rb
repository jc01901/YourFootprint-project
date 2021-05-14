require 'test_helper'
require 'leaderboard_helper'

class LeaderboardHelperTest < ActionDispatch::IntegrationTest
    include LeaderboardHelper
    setup do
      @users = Array.new
      
    end

    test "should return correct users with only one user posting within the last 7 days" do
      user4 = User.create({
        :email => "fakename1@surrey.ac.uk",
        :password => "12345678",
        :password_confirmation => "12345678",
        :firstname => "Jihn",
        :surname => "Johnson",
        :dob => "13/03/1999",
        :post_code => "GU2 7JW",
        :lifetime_points => 31
      })
      user4.save!
      user4.user_data.create({
        :date => DateTime.current - 1,
        :electricity_usage => 341,
        :petrol => 350,
        :user_points => 21
      })
      user4.save!

      user5 = User.create({
        :email => "fakename2@surrey.ac.uk",
        :password => "12345678",
        :password_confirmation => "12345678",
        :firstname => "Jihn",
        :surname => "Johnson",
        :dob => "13/03/1999",
        :post_code => "GU2 7JW",
        :lifetime_points => 31
      })
      user5.save!

      user5.user_data.create({
        :date => DateTime.current - 8,
        :electricity_usage => 341,
        :petrol => 350,
        :user_points => 21
      })
      user5.save!
      @users.push(user4)
      @users.push(user5)
      actual = last_seven_days_check(@users)

      expected = Array.new

      expected.push(user4)
      assert_equal(expected, actual)
    end
  
  end