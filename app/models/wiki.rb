require 'wikipedia'

class Wiki < ActiveRecord::Base

  def api_call
    search_date = Wikipedia.find("#{format_date}")
    JSON.load(open(search_date.content))
  end

  def format_date
    date = self.date.to_formatted_s(:long_ordinal)
    date[/[^,]+/]
  end

end
