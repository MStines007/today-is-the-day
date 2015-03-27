class Collection < ActiveRecord::Base

	# Instances of this class should have instances of
		# NewsItem
		# WikiItem
		# MemeItem
	#Instances of this class will make up the content on the custom report page

	belongs_to :user
	has_many :news_items
	has_many :wiki_items
  has_many :giphy_items
	# has_many :meme_items

end