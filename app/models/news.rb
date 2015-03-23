require 'open-uri'

class News < ActiveRecord::Base

  # URL = "http://api.nytimes.com/svc/search/v2/articlesearch.response-format?[q=search term&fq=filter-field:(filter-term)&additional-params=values]&api-key=#{ENV['NYTIMES_KEY']}"

  
  def api_call
    # type = JSON
    
    url = "http://api.nytimes.com/svc/search/v2/articlesearch.json?begin_date=#{self.date.to_s.gsub("-","")}&end_date=#{self.date.to_s.gsub("-","")}&api-key=#{ENV['NYTIMES_KEY']}"
    binding.pry
    response_hash = JSON.load(open(url))
  end

  def get_date_string
    #{self.date.year}#{self.date.month}#{self.date.day}

  end

  def open_url
    self.news_json = JSON.load(open(self.api_call))["results"]
  end

end



