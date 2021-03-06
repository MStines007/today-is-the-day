require 'wikipedia'

class WikiBirthItem < ActiveRecord::Base
  belongs_to :collection

  attr_accessor :wiki_json

  def self.new_from_date(date)
    page_array = self.birth_api_call(date)
    page_array.collect do |birth|
      self.new(:birth => birth)
    end
  end

  def self.birth_api_call(date)
    search_date = Wikipedia.find("#{self.format_date(date)}").sanitized_content  
    @wiki_json= JSON.parse([search_date].to_json).to_s.split("==")
    random_birth_item
  end 

  def self.format_date(date)
    date.to_datetime.to_formatted_s(:long_ordinal)[/[^,]+/]
  end

  def self.wiki_births_array
    @wiki_json[4].split("*").compact.reject(&:blank?)
  end

  def self.random_birth_item
    birth_item = wiki_births_array.sample(5)
    birth_item.each do |birth|
      birth.gsub("\n", "").gsub("<",'').gsub(">",'').gsub("/p",'').squish
    end

  end
end
