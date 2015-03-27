require 'wikipedia'

class WikiItem < ActiveRecord::Base
  belongs_to :collection

  attr_accessor :wiki_json

  def api_call
    @search_date = Wikipedia.find("#{format_date}")  
    open_url
    random_event_item
    # binding.pry

  end 

  def format_date
    # make date compatible for use in wiki api call
    date = self.date.to_formatted_s(:long_ordinal)
    date[/[^,]+/]
  end

  def open_url
    # Gets wiki data array for given date
    self.wiki_json = JSON.parse([@search_date].to_json).first.to_s.split("==")
  end

  def wiki_events_array
    self.wiki_json[2].split("*").compact.reject(&:blank?)
  end

  def wiki_births_array
    self.wiki_json[4].split("*").compact.reject(&:blank?)
  end

  def wiki_holidays_array
    self.wiki_json[8].split("*").compact.reject(&:blank?)
  end

  def random_event_item
    event_item = wiki_events_array.sample.gsub("]", "").gsub("[", "").gsub("|"," ").gsub(";", ":").gsub("{","").gsub("{","")
    event_item["&ndash"]= "" && event_item["\\\\n"]=""
    event_item.squish
  end

  def random_birth_item
     birth_item = wiki_births_array.sample.gsub("]", "").gsub("[", "").gsub("|"," ").gsub(";", ":").gsub("{","").gsub("{","").gsub("\n","")
     birth_item["&ndash"]= "" && birth_item["\\\\n"]=""   
     birth_item.squish
  end

  def sanitize_holiday_item
    if @holiday_item.include? "&ndash"
       @holiday_item["&ndash"]= ""  
       @holiday_item["\\\\n"]=""
    else 
      @holiday_item["\\\\n"]=""
    end
      @holiday_item
  end

  def random_holiday_item
    @holiday_item = wiki_holidays_array.sample.gsub("]", "").gsub("[", "").gsub("|"," ").gsub(";", ":").gsub("{","").gsub("{","").gsub("""","").gsub("\n","")
    # holiday_item["&ndash"]= ""
    if @holiday_item == ""
      random_holiday_item
    else
      sanitize_holiday_item.squish
    end
  end

end



# ACTUAL CODE

# 1.) *****create_data_array
# @data_array = JSON.parse([search_date].to_json).first.to_s.split("==")   OK!


# 2.) events_array
#   event_items = @wiki_data_array[2].split("*").compact.reject(&:blank?)    OK!

# 3.) births_array
#   birth_items = @wiki_data_array[4].split("*").compact.reject(&:blank?)   

# 4.) holidays_array
#   holiday_items = @wiki_data_array[8].split("*").compact.reject(&:blank?)    OK!

# 5.) sample_event_item    OK!!
#     event_item = event_items.sample.gsub("]", "").gsub("[", "").gsub("|"," ").gsub(";", ":").gsub("{","").gsub("{","")
#     event_item["&ndash"]= ""
#     event_item["\\\\n"]=""
#     event_item.squish

# # # 6.) sample_birth_item    OK!!
#     birth_item = birth_items.sample.gsub("]", "").gsub("[", "").gsub("|"," ").gsub(";", ":").gsub("{","").gsub("{","").gsub("\n","")
#     birth_item["&ndash"]= ""
#     birth_item["\\\\n"]=""
#     birth_item.squish

# # # 7.) sample_holiday_item    OK!!
#     holiday_item = holiday_items.sample.gsub("]", "").gsub("[", "").gsub("|"," ").gsub(";", ":").gsub("{","").gsub("{","").gsub("""","").gsub("\n","")

#     holiday_item["&ndash"]= ""
#     holiday_item["\\\\n"]=""
#     holiday_item.squish