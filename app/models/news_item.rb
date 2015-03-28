class NewsItem < ActiveRecord::Base

########TODO: How can api_call and response_page be class methods when I need to get the date in the API call from an instance of a collection??

	require 'open-uri'

	belongs_to :collection

	attr_reader :response_hash

# ----- INSTANCE METHODS
  # def initialize
    
  # end

# ----- CLASS METHODS
  def self.createFromDate(date)
  	api_call(date)["response"]["docs"].collect do |article|
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