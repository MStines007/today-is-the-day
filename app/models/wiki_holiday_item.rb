require 'wikipedia'

class WikiHolidayItem < ActiveRecord::Base
  belongs_to :collection

  attr_accessor :wiki_json

  def self.create_from_date(date)
    page_array = self.holiday_api_call(date)
    # binding.pry
    page_array.collect do |holiday|
      self.create(:holiday => holiday)
    end
  end

  def self.holiday_api_call(date)
    search_date = Wikipedia.find("#{self.format_date(date)}").sanitized_content  
    @wiki_json= JSON.parse([search_date].to_json).to_s.split("==")
    random_holiday_item
  end

  def self.format_date(date)
    # make date compatible for use in wiki api call
    date.to_datetime.to_formatted_s(:long_ordinal)[/[^,]+/]
  end

  def self.wiki_holidays_array
    @wiki_json[8].split("*").compact.reject(&:blank?)
  end

  def self.random_holiday_item

    holiday_item = wiki_holidays_array.sample(3)
    holiday_item.each do |holiday|
      holiday.gsub("<",'').gsub(">",'').gsub("/p",'').gsub("\\",'').gsub("</p>",'').gsub("<p>",'').gsub("\\n",'').squish
      # holiday["&ndash;"]= ":"
      holiday.html_safe
    end
  end
end

# def sanitize_holiday_item
  #   if @holiday_item.include? "&ndash"
  #      @holiday_item["&ndash"]= ""  
  #      @holiday_item["\\\\n"]=""
  #   else 
  #     @holiday_item["\\\\n"]=""
  #   end
  #     @holiday_item
  # end

  


