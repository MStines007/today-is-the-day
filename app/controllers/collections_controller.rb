class CollectionsController < ApplicationController

	def new
		@collection = Collection.new
		render :new
	end

	def create
		date = params[:collection][:date]
		@collection = Collection.create(:date => date)
		@collection.wiki_items.build(:date => date)
		@collection.giphy_items.build(:date => date)
		binding.pry
		@collection.news_items = NewsItem.createFromDate(date)

		@collection.save
		# binding.pry
		redirect_to collection_path(@collection.id)
	end

	def show
		@collection = Collection.find(params[:id])
	end
	
end

