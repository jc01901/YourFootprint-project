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
      power = params["calculator"]["power"]
      distance = params["calculator"]["distance"]
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
        if power == "" && distance == ""
          @errors.push("You must enter at least one of either power or distance")
          render 'calculator'
        else
          if power =~ /[a-zA-Z]/ || distance =~ /[a-zA-Z]/
            if power =~ /[a-zA-Z]/
              @errors.push("You must enter a number for power")
            end
            if distance =~ /[a-zA-Z]/
              @errors.push("You must enter a number for distance")
            end
            render 'calculator'          
          else
            power = power.to_f()
            distance = distance.to_f()
            converted_inputs = helpers.co2e_conversion(power, distance, distance_type, fuel_type)
            

            # create User_data database record
            UserData.create(user_id: current_user.id, date: DateTime.current.midnight, petrol: converted_inputs["petrol_co2e"].ceil + converted_inputs["diesel_co2e"].ceil, electricity_usage: converted_inputs["power_co2e"].ceil, user_points: converted_inputs["user_points"])
            lifetime_points = current_user.lifetime_points
            # update user lifetime_points 
            User.find(current_user.id).update_attribute(:lifetime_points, (lifetime_points + converted_inputs["user_points"]))
            @success.push("Successfully submitted data!")
            # update view
            render 'calculator'
            # send user back to homepage (not final)
          # redirect_to root_path
          end
        end
      end
    end
  end

  def show
  end

end
