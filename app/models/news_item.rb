class NewsItem < ActiveRecord::Base

	require 'open-uri'

	belongs_to :collection

	attr_reader :response_hash

  def api_call
    url = "http://api.nytimes.com/svc/search/v2/articlesearch.json?fq=section_name.contains:Front&begin_date=#{self.get_date_string}&end_date=#{get_date_string}&-war&-death&-kill&-die&-rape&api-key=#{ENV['NYTIMES_KEY']}"
    binding.pry
    @response_hash = JSON.load(open(url))
  end

  def get_date_string
    self.date.to_s.gsub("-","")[0..7]
  end

  def top_3_results
  	api_call
  	binding.pry
  	self.response_hash["response"]["docs"].collect do |article|
  		headline = article["headline"]["main"]
  		snippet = article["snippet"]
  		link = article["web_url"]
  		binding.pry
  		"#{headline}: #{snippet}, #{link}"
  	end
  end


  # so I have a model. instances of the model should be 1 article. articles come in an array.

  # From articles, want: "headline": response_hash["response"]["docs"][0]["headline"]["main"], 
  # response_hash["response"]["docs"][0]["snippet"] - snippet", response_hash["response"]["docs"][0]["web_url"] - "web_url" 


end
