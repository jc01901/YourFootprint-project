class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  def home
  end

  def about
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
