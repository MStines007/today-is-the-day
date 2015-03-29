require 'wikipedia'
require 'sanitize'

class WikiEventItem < ActiveRecord::Base
  belongs_to :collection

  attr_accessor :wiki_json

  def self.create_from_date(date)
    page_array = self.event_api_call(date)
    page_array.collect do |event|
      self.create(:event => event)
    end
  end

  def self.event_api_call(date)
    search_date = Wikipedia.find("#{self.format_date(date)}").sanitized_content  
    @wiki_json= JSON.parse([search_date].to_json).to_s.split("==")
    random_event_item
  end 

  def self.format_date(date)
    # make date compatible for use in wiki api call
    date.to_datetime.to_formatted_s(:long_ordinal)[/[^,]+/]
  end

  def self.wiki_events_array
    @wiki_json[2].split("*").compact.reject(&:blank?)
  end

  def self.random_event_item
    event_item = wiki_events_array.sample(5)
    event_item.each do |event|
      #binding.pry
      event.gsub('\n',"").gsub("<",'').gsub(">",'').gsub("/p",'').squish
      # binding.pry
      # if event["&ndash;"]= ":"
      #   event.html_safe
      # else 
      #   event.html_safe
      #end 
    end
  end
end
