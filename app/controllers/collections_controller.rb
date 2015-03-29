class CollectionsController < ApplicationController

	def new
		@collection = Collection.new
		render :new
	end

	def create
		@collection = Collection.create(:date => params[:collection][:date])
		# @collection.wiki_items.build(:date => params[:collection][:date])
		# 
		@collection.giphy_items.build(:date => params[:collection][:date])

		@collection.wiki_event_items = WikiEventItem.create_from_date(params[:collection][:date])

		@collection.wiki_birth_items = WikiBirthItem.create_from_date(params[:collection][:date])

		@collection.wiki_holiday_items = WikiHolidayItem.create_from_date(params[:collection][:date])

		@collection.news_items = NewsItem.createFromDate(params[:collection][:date])




		@collection.save
		binding.pry
		redirect_to collection_path(@collection.id)
	end

	def show
		@collection = Collection.find(params[:id])
	end
	
end

