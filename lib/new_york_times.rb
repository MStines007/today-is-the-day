require 'open-uri'


class NYTimes

  URL = "http://api.nytimes.com/svc/search/v2/articlesearch.response-format?[q=search term&fq=filter-field:(filter-term)&additional-params=values]&api-key=#{ENV['NYTIMES_KEY']}"

  attr_accessor :api_call, :news_json

  def initialize 
    self.api_call = URL
    open_url
  end

  def open_url
    self.news_json = JSON.load(open(self.api_call))["results"]
  end

end