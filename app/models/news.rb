require 'open-uri'
require 'wikipedia'

class News < ActiveRecord::Base

  # URL = "http://api.nytimes.com/svc/search/v2/articlesearch.response-format?[q=search term&fq=filter-field:(filter-term)&additional-params=values]&api-key=#{ENV['NYTIMES_KEY']}"

  
  def api_call
    url = "http://api.nytimes.com/svc/search/v2/articlesearch.json?begin_date=1952#{get_date_string}&end_date=2015#{get_date_string}&fl=headline%2Csnippet%2Cpub_date&api-key=#{ENV['NYTIMES_KEY']}"
    # binding.pry
    response_hash = JSON.load(open(url))
  end

  def get_date_string
    self.date.to_s.gsub("-","")[4..7]
  end

end



# NOTE: need to make sure the news class know the user selected category. That category will be inserted into API call as search perameter.

# like so...
# "http://api.nytimes.com/svc/search/v2/articlesearch.json?q=#{INSERT CATEGORY HERE}&begin_date=19700302&end_date=19700302&fl=headline%2Csnippet%2Cpub_date&api-key=#{ENV['NYTIMES_KEY']}"



