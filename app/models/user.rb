class User < ActiveRecord::Base

	has_one :collection
	has_many :news_items, through: :collection
	has_many :wiki_items, through: :collection
	# validates_presence_of :name

end
