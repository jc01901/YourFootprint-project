class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  def home

    # connect to the website airnowapi.org
    require 'net/http'
    require 'json'
        
    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=20002&distance=25&API_KEY=A99F9904-9D5E-49D7-930D-D1A77B37F913'
    @uri = URI(@url)
    # Gets the result from the website
    @response = Net::HTTP.get(@uri) # => string
    @air_output = JSON.parse(@response) # turns string into a javascript object
    # <%= @air_output[0]['AQI'] %> = to show AQI output

    # Check for empty response
    if @air_output.empty?
      @final_output = "Error"
    elsif !@air_output
      @final_output = "Error"
    else
      @final_output = @air_output[0]['AQI']
    end

    # Changes jumbotron colour depending on the output
    if @final_output == "Error"
      @box_colour = "grey"
    elsif @final_output <= 50
      @box_colour = "green"
    elsif @final_output >= 51 && @final_output <= 100
      @box_colour = "yellow"
    elsif @final_output >= 101 && @final_output <= 150
      @box_colour = "orange"
    elsif @final_output >= 151 && @final_output <= 200
      @box_colour = "red"
    elsif @final_output >= 201 && @final_output <= 300
      @box_colour = "purple"
    else @final_output >= 300
      @box_colour = "maroon"
    end
  end

  def about
  end

  def terms
  end

  def request_contact
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone] 
    message = params[:message]
    
    if email.blank?
      flash.alert = "You have to enter a valid email"
      redirect_to request.referer
    else
      flash.notice = "Your message has been sent"
      redirect_to root_path
    end
  end

end
