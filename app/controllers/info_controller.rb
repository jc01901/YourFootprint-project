class InfoController < ApplicationController
  def info
    get_articles()
  end

  def get_articles

    # Init
    newsapi = News.new("6bc9b9135f7642a3b1ab8f826816e3ce")

    # The list of keywords to query for
    query_elements = ["climate change","environment"]

    query = ''
    query_elements.each { |ele| query += ('"' + ele + '"' + '+OR+') }   # Encode the list into a single valid string
    query = query.delete_suffix('+OR+')                                 # Remove the final "+OR+"

    # Create a time object and set time one week previous
    time = Time.now() - 7*(3600*24)
    time_str = time.strftime("%Y-%m-%dT%H:%M:%S")

    # Log NewsAPI query
    logger.info "Building query with:\n"\
                "\tquery:     #{query}\n"\
                "\ttime:      #{time_str}\n"\
                "Querying NewsAPI..."

    begin
      # Retrieve top headlines
      @news_articles = newsapi.get_everything(q:  query, from:  time_str, language: 'en', pageSize: 20)
      # @news_articles = newsapi.get_top_headlines(q:  query, country: 'en')

    rescue => e
      # Catch any exceptions and allow website to continue running
      logger.error "Exception when retrieving articles:\n"\
                   "\te Class:      #{ e.class.name }\n"\
                   "\te Message:    #{ e.message }\n"\
                   "#{ e.full_message }"
      @news_articles = []
    end

    # Log number of articles recieved from query
    logger.info "Number of articles retrieved: #{@news_articles.length()}"

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

    # n = NewsArticle.new(name: 'bob', age: '18')
    n = NewsArticle.new(@news_articles[0])
    puts "-----------"
    puts n
    puts "-----------"
    puts n.name
    puts "-----------"
    puts n.age
    puts "-----------"

  end
end
