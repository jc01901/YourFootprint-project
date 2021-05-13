class CalculatorController < ApplicationController
  def calculator

  end

  def create
    @errors = Array.new
    @success = Array.new
    if !current_user.present?
      @errors.push("You must be signed in to submit")
      render 'calculator'
    else
    
      # collect user inputs and give them variables
      power = params["calculator"]["power"].to_f()
      distance = params["calculator"]["distance"].to_f()
      distance_type = params["calculator"]["distanceRadios"]
      fuel_type = params["calculator"]["fuelRadios"]
      if distance_type.blank? || fuel_type.blank?
        if distance_type.blank?
          @errors.push("You must select a distance unit")
        end
        if fuel_type.blank?
          @errors.push("You must select a fuel unit")
        end
        render 'calculator'
      else
        # initilize output variables
        power_co2e = 0.0
        petrol_co2e = 0.0
        diesel_co2e = 0.0 
        total_co2e = 0.0 
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
        case [fuel_type, distance_type]
        when ["petrol", "kilometers"]
          petrol_co2e += distance * petrol_conversion_km
        when ["petrol", "miles"]
          petrol_co2e += distance * petrol_conversion_miles
        when ["diesel", "kilometers"]
          diesel_co2e += distance * diesel_conversion_km
        when ["diesel", "miles"]
          diesel_co2e += distance * diesel_conversion_miles
        else
          petrol_co2e = 0
          diesel_co2e = 0
        end
        # generate total co2e produced
        total_co2e = power_co2e + petrol_co2e + diesel_co2e

        # allocate points
        user_points = total_co2e.ceil

        # create User_data database record
        UserData.create(user_id: current_user.id, date: DateTime.current.midnight, petrol: petrol_co2e.ceil + diesel_co2e.ceil, electricity_usage: power_co2e.ceil, user_points: user_points)
        lifetime_points = current_user.lifetime_points
        # update user lifetime_points 
        User.find(current_user.id).update_attribute(:lifetime_points, (lifetime_points + user_points))
        @success.push("Successfully submitted data!")
        # update view
        render 'calculator'
        # send user back to homepage (not final)
      # redirect_to root_path
      end
    end
  end

  def show
  end

end
