class User < ActiveRecord::Base

	has_one :collection_of_bday_trivia
	has_many :news_items, through: :collection_of_bday_trivia
	has_many :wiki_items, through: :collection_of_bday_trivia
	# validates_presence_of :name

end
