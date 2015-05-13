class CollectionsController < ApplicationController

	def new
		@collection = Collection.new
		render :new
	end

	def create
		date = params[:collection][:date]

		@collection = Collection.new(:date => date)
		@collection.giphy_items.build(:date => date)
		@collection.wiki_event_items = WikiEventItem.new_from_date(date)
		@collection.wiki_birth_items = WikiBirthItem.new_from_date(date)
		@collection.wiki_holiday_items = WikiHolidayItem.new_from_date(date)
		@collection.news_items = NewsItem.new_from_date(date)
		@collection.to_name = params[:collection][:to_name]
		
		@collection.save

		redirect_to collection_path(@collection.id)
	end

	def show
		find_collection
	end

	def update
		find_collection
		create
	end

	def send_email
		find_collection
		@collection.update(collection_params)
		CollectionMailer.gift_email(@collection).deliver_now
		flash[:notice] = "Email Sent!"
		redirect_to collection_path(@collection.id)
	end

	#----- HELPERS
	private
	
	def find_collection
		@collection = Collection.find(params[:id])
	end

		def collection_params
			params.require(:collection).permit(:to_name, :to_email, :from_name, :from_email)
		end
	
end