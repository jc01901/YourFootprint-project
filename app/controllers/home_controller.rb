class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  def home
    get_articles()
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

  def get_articles

    # Init
    #newsapi = News.new("6bc9b9135f7642a3b1ab8f826816e3ce")

    # The list of keywords to query for
    query_elements = ["climate change","environment"]

    query = ''
    query_elements.each { |ele| query += ('"' + ele + '"' + '+OR+') }   # Encode the list into a single valid string
    query = query.delete_suffix('+OR+')                                 # Remove the final "+OR+"

    # Create a time object and set time one week previous
    time = Time.now() - 7*(3600*24)
    time_str = time.strftime("%Y-%m-%dT%H:%M:%S")

    begin
      # Retrieve top headlines
      @news_articles = newsapi.get_everything(q:  query, from:  time_str, language: 'en')

    rescue => e
      # Catch any exceptions and allow website to continue running
      logger.error "Exception when retrieving articles:\n"\
                   "\te Class:      #{ e.class.name }\n"\
                   "\te Message:    #{ e.message }\n"\
                   "#{ e.full_message }"
      @news_articles = []
    end

		# @news_articles is an array of article objects, the following shows what data the objects contain and how to access them:
		# (Where x is some index in the array)
		# 
		# @news_articles[x].id
		# @news_articles[x].name
		# @news_articles[x].author
		# @news_articles[x].title
		# @news_articles[x].description
		# @news_articles[x].content
		# @news_articles[x].url
		# @news_articles[x].urlToImage
		# @news_articles[x].publishedAt

  end

  def get_air
    #connect to the website
    require 'net/http'
    require 'json'

    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=20002&distance=25&API_KEY=A99F9904-9D5E-49D7-930D-D1A77B37F913'
    @uri = URI(@url)
    #Gets the result from the website
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
end
