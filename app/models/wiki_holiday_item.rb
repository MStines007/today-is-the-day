require 'wikipedia'

class WikiHolidayItem < ActiveRecord::Base
  belongs_to :collection

  attr_accessor :wiki_json

  def self.new_from_date(date)
    page_array = self.holiday_api_call(date)
    page_array.collect do |holiday|
      self.new(:holiday => holiday)
    end
  end

  def self.holiday_api_call(date)
    search_date = Wikipedia.find("#{self.format_date(date)}").sanitized_content  
    @wiki_json= JSON.parse([search_date].to_json).to_s.split("==")
    random_holiday_item
  end

  def self.format_date(date)
    date.to_datetime.to_formatted_s(:long_ordinal)[/[^,]+/]
  end

  def self.wiki_holidays_array
    @wiki_json[8].split("*").compact.reject(&:blank?)
  end

  def self.random_holiday_item
    holiday_item = wiki_holidays_array.sample(4)
    holiday_item.each do |holiday|
      holiday.gsub("<",'').gsub(">",'').gsub("/p",'').gsub("\\",'').gsub("</p>",'').gsub("<p>",'').gsub("\\n",'').squish
    end
  end
end


