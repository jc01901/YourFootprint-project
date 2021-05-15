module CalculatorHelper
    def co2e_conversion(power, distance, distance_type, fuel_type)
        # initilize output variables
        power_co2e = 0.0
        petrol_co2e = 0.0
        diesel_co2e = 0.0 
        total_co2e = 0.0 
        output_variables = Hash.new
        # conversion parameters
        power_conversion = 0.2556
        petrol_conversion_km = 0.18084 
        diesel_conversion_km = 0.17336
        petrol_conversion_miles = 0.29103
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
        output_variables = {"user_points" => user_points, "total_co2e" => total_co2e, "petrol_co2e" => petrol_co2e, "diesel_co2e" => diesel_co2e, "power_co2e" => power_co2e }
    end
end
