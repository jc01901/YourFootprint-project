require 'test_helper'
require 'leaderboard_helper'

class LeaderboardHelperTest < ActionDispatch::IntegrationTest
    include LeaderboardHelper
    setup do
      @users = Array.new
    end

    test "Alltime leaderboard - should return correct users with only one user posting within the last 7 days" do
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

    test "Alltime leaderboard - should return an empty array" do
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
      :date => DateTime.current - 8,
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
    assert_equal(expected, actual)
    end
    test "Alltime leaderboard - should return array in the correct order" do
      user4 = User.create({
        :email => "fakename1@surrey.ac.uk",
        :password => "12345678",
        :password_confirmation => "12345678",
        :firstname => "Jihn",
        :surname => "Johnson",
        :dob => "13/03/1999",
        :post_code => "GU2 7JW",
        :lifetime_points => 50
      })
      user4.save!
      user4.user_data.create({
        :date => DateTime.current - 1,
        :electricity_usage => 341,
        :petrol => 350,
        :user_points => 50
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
        :date => DateTime.current - 1,
        :electricity_usage => 341,
        :petrol => 350,
        :user_points => 21
      })
      user5.save!
      @users.push(user5)
      @users.push(user4)
      actual = last_seven_days_check(@users)
      expected = Array.new
      expected = @users
      assert_equal(expected, actual)
      end

      test "Weekly leaderboard - should return correct weekly points value" do
        user4 = User.create({
          :email => "fakename1@surrey.ac.uk",
          :password => "12345678",
          :password_confirmation => "12345678",
          :firstname => "Jihn",
          :surname => "Johnson",
          :dob => "13/03/1999",
          :post_code => "GU2 7JW",
          :lifetime_points => 42
        })
        user4.save!
        user4.user_data.create({
          :date => DateTime.current - 8,
          :electricity_usage => 341,
          :petrol => 350,
          :user_points => 21
        })
        user4.user_data.create({
          :date => DateTime.current - 1,
          :electricity_usage => 341,
          :petrol => 350,
          :user_points => 21
        })
        @users = Array.new
        @users.push(user4)
        user4.save!
        expected = user4.user_data[1].user_points
        actual = weekly_co2e(@users)
        assert_equal(expected, actual[0][1])
      end

      test "Weekly leaderboard - should return empty" do
        user4 = User.create({
          :email => "fakename1@surrey.ac.uk",
          :password => "12345678",
          :password_confirmation => "12345678",
          :firstname => "Jihn",
          :surname => "Johnson",
          :dob => "13/03/1999",
          :post_code => "GU2 7JW",
          :lifetime_points => 42
        })
        user4.save!
        user4.user_data.create({
          :date => DateTime.current - 8,
          :electricity_usage => 341,
          :petrol => 350,
          :user_points => 21
        })
        user4.user_data.create({
          :date => DateTime.current - 1,
          :electricity_usage => 341,
          :petrol => 350,
          :user_points => 0
        })
        @users = Array.new
        @users.push(user4)
        user4.save!
        expected = Array.new
        actual = weekly_co2e(@users)
        assert_equal(expected, actual)
      end

      test "Weekly leaderboard - should return array in correct order" do
        user4 = User.create({
          :email => "fakename1@surrey.ac.uk",
          :password => "12345678",
          :password_confirmation => "12345678",
          :firstname => "Jihn",
          :surname => "Johnson",
          :dob => "13/03/1999",
          :post_code => "GU2 7JW",
          :lifetime_points => 61
        })
        user4.save!
        user4.user_data.create({
          :date => DateTime.current - 8,
          :electricity_usage => 341,
          :petrol => 350,
          :user_points => 40
        })
        user4.user_data.create({
          :date => DateTime.current - 1,
          :electricity_usage => 341,
          :petrol => 350,
          :user_points => 21
        })

        user5 = User.create({
        :email => "fakename2@surrey.ac.uk",
        :password => "12345678",
        :password_confirmation => "12345678",
        :firstname => "Jihn",
        :surname => "Johnson",
        :dob => "13/03/1999",
        :post_code => "GU2 7JW",
        :lifetime_points => 42
      })
      user5.save!
  
      user5.user_data.create({
        :date => DateTime.current - 1,
        :electricity_usage => 341,
        :petrol => 350,
        :user_points => 21
      })
      user5.save!
      user5.user_data.create({
        :date => DateTime.current - 1,
        :electricity_usage => 341,
        :petrol => 350,
        :user_points => 21
      })
      user5.save!
        @users = Array.new
        @users.push(user5)
        @users.push(user4)
        expected = Array.new
        expected.push([user4, user4.user_data[1].user_points])
        expected.push([user5, user5.user_data[0].user_points + user5.user_data[1].user_points])
        actual = weekly_co2e(@users)
        assert_equal(expected, actual)
      end

  end