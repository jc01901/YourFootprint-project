class CalculatorController < ApplicationController
  def calculator
    # collect user inputs and give them variables
    power = params[:power]
    petrol_km = params[:petrol_km]
    diesel_km = params[:diesel_km]
    petrol_miles = params[:petrol_miles]
    diesel_miles = params[:deisel_miles] 
    # initilize output variables
    power_co2e = 0
    petrol_co2e = 0
    diesel_co2e = 0 
    total_co2e = 0 
    # conversion parameters
    power_conversion = 0.2556
    petrol_conversion_km = 0.18084 
    diesel_conversion_km = 0.17336
    petrol_converison_miles = 0.29103
    diesel_conversion_miles = 0.27901
    # check if the user inputted each variable, if blank do not add any co2e
    if !power.blank?
      power_co2e = power * power_conversion
    end
    if !petrol_km.blank?
      petrol_co2e += petrol_km * petrol_conversion_km
    end
    if !petrol_miles.blank?
      petrol_co2e += petrol_miles * petrol_conversion_miles
    end
    if !diesel_km.blank?
      diesel_co2e += diesel_km * diesel_conversion_km
    end
    if !diesel_miles.blank?
      diesel_co2e += diesel_miles * diesel_conversion_miles
    end
    # generate total co2e produced
    total_co2e = power_co2e + petrol_co2e + diesel_co2e
    # allocate points
    user_points = total_co2e.round()
    # create User_data database record
    User_data.create(user_id: user.id, date: DateTime.current.midnight, petrol_usage: petrol_co2e, diesel_usage: diesel_co2e, power_usage: power_co2e, user_points: user_points)
    # send user back to homepage (not final)
    redirect_to root_path
  end

end
