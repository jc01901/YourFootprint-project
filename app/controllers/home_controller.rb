class HomeController < ApplicationController
  def home
    get_articles()
  end

  def about
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

    # Retrieve top headlines
    @top_headlines = newsapi.get_everything(q:  query,
                                            from:  time_str)

  end
end
