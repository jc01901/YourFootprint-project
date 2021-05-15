require 'test_helper'
require 'leaderboard_helper'
class LeaderboardHelperTest < ActionDispatch::IntegrationTest
    include CalculatorHelper
    setup do
        @power_conversion = 0.2556
        @petrol_conversion_km = 0.18084 
        @diesel_conversion_km = 0.17336
        @petrol_conversion_miles = 0.29103
        @diesel_conversion_miles = 0.27901
    end
    test "co2e conversion - should return correct value - kilometers and petrol" do
        power = 5
        distance = 5
        fuel_type = "petrol"
        distance_type = "kilometers" 
        actual = co2e_conversion(power, distance, distance_type, fuel_type)
        petrol_co2e = distance * @petrol_conversion_km
        diesel_co2e = 0
        power_co2e = power * @power_conversion
        total_co2e = petrol_co2e + diesel_co2e + power_co2e
        user_points = total_co2e.ceil
        expected = {"user_points" => user_points, "total_co2e" => total_co2e, "petrol_co2e" => petrol_co2e, "diesel_co2e" => diesel_co2e, "power_co2e" => power_co2e }
        assert_equal(expected, actual)
    end

    test "co2e conversion - should return correct value - kilometers and diesel" do
        power = 5
        distance = 5
        fuel_type = "diesel"
        distance_type = "kilometers" 
        actual = co2e_conversion(power, distance, distance_type, fuel_type)
        petrol_co2e = 0
        diesel_co2e = distance * @diesel_conversion_km
        power_co2e = power * @power_conversion
        total_co2e = petrol_co2e + diesel_co2e + power_co2e
        user_points = total_co2e.ceil
        expected = {"user_points" => user_points, "total_co2e" => total_co2e, "petrol_co2e" => petrol_co2e, "diesel_co2e" => diesel_co2e, "power_co2e" => power_co2e }
        assert_equal(expected, actual)
    end

    test "co2e conversion - should return correct value - miles and petrol" do
        power = 5
        distance = 5
        fuel_type = "petrol"
        distance_type = "miles" 
        actual = co2e_conversion(power, distance, distance_type, fuel_type)
        petrol_co2e = distance * @petrol_conversion_miles
        diesel_co2e = 0
        power_co2e = power * @power_conversion
        total_co2e = petrol_co2e + diesel_co2e + power_co2e
        user_points = total_co2e.ceil
        expected = {"user_points" => user_points, "total_co2e" => total_co2e, "petrol_co2e" => petrol_co2e, "diesel_co2e" => diesel_co2e, "power_co2e" => power_co2e }
        assert_equal(expected, actual)
    end

    test "co2e conversion - should return correct value - miles and diesel" do
        power = 5
        distance = 5
        fuel_type = "diesel"
        distance_type = "miles" 
        actual = co2e_conversion(power, distance, distance_type, fuel_type)
        petrol_co2e = 0
        diesel_co2e = distance * @diesel_conversion_miles
        power_co2e = power * @power_conversion
        total_co2e = petrol_co2e + diesel_co2e + power_co2e
        user_points = total_co2e.ceil
        expected = {"user_points" => user_points, "total_co2e" => total_co2e, "petrol_co2e" => petrol_co2e, "diesel_co2e" => diesel_co2e, "power_co2e" => power_co2e }
        assert_equal(expected, actual)
    end
end