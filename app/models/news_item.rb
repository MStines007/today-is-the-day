class NewsItem < ActiveRecord::Base

########TODO: How can api_call and response_page be class methods when I need to get the date in the API call from an instance of a collection??

	require 'open-uri'

	belongs_to :collection

	attr_reader :response_hash

# ----- INSTANCE METHODS
  # def initialize
    
  # end

# ----- CLASS METHODS
#### These are currently not working as class methods because date is not a class property........
  def self.response_page
  	api_call
  	binding.pry
  	self.response_hash["response"]["docs"].collect do |article|
  		headline = article["headline"]["main"]
  		snippet = article["snippet"]
  		link = article["web_url"]

  		binding.pry
  	end
  end

  def self.api_call
    url = "http://api.nytimes.com/svc/search/v2/articlesearch.json?fq=section_name.contains:Front&begin_date=#{self.get_date_string}&end_date=#{get_date_string}&-war&-death&-kill&-die&-rape&api-key=#{ENV['NYTIMES_KEY']}"
    self.response_hash = JSON.load(open(url))
  end

# ----- HELPERS
  def get_date_string
    date.to_s.gsub("-","")[0..7]
  end

end