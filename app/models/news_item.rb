class NewsItem < ActiveRecord::Base

	require 'open-uri'

	belongs_to :collection

	attr_reader :response_hash

# ----- CLASS METHODS
  def self.create_from_date(date)
  	api_call(date)["response"]["docs"][0..4].collect do |article|
  		headline = article["headline"]["main"]
  		snippet = article["snippet"]
  		link = article["web_url"]
      self.create(:headline => headline, :snippet => snippet, :link => link)
     
  	end
  end

  def self.api_call(date)
    url = "http://api.nytimes.com/svc/search/v2/articlesearch.json?fq=section_name.contains:Front&begin_date=#{self.get_date_string(date)}&end_date=#{get_date_string(date)}&-war&-death&-kill&-die&-rape&api-key=#{ENV['NYTIMES_KEY']}"
    response_hash = JSON.load(open(url))
  end

# ----- HELPERS
  def self.get_date_string(date)
    date.to_s.gsub("-","")[0..7]
  end

end