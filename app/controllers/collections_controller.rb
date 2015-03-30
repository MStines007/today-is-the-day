class CollectionsController < ApplicationController

	def new
		@collection = Collection.new
		render :new
	end

	def create

		# @collection = Collection.create(:date => params[:collection][:date])
		# @collection.giphy_items.build(:date => params[:collection][:date])
		# @collection.wiki_event_items = WikiEventItem.create_from_date(params[:collection][:date])
		# @collection.wiki_birth_items = WikiBirthItem.create_from_date(params[:collection][:date])
		# @collection.wiki_holiday_items = WikiHolidayItem.create_from_date(params[:collection][:date])
		# @collection.news_items = NewsItem.createFromDate(params[:collection][:date])
		# @collection.save

		date = params[:collection][:date]

		@collection = Collection.create(:date => date)
		@collection.giphy_items.build(:date => date)
		@collection.wiki_event_items = WikiEventItem.create_from_date(date)
		@collection.wiki_birth_items = WikiBirthItem.create_from_date(date)
		@collection.wiki_holiday_items = WikiHolidayItem.create_from_date(date)
		@collection.news_items = NewsItem.create_from_date(date)
		@collection.to_name = params[:collection][:to_name]
		@collection.save


		redirect_to collection_path(@collection.id)
	end

	def show
		find_collection
	end

	def send_email
		find_collection
		@collection.update(collection_params)
		CollectionMailer.gift_email(@collection).deliver_now
		redirect_to collection_path(@collection.id)

	end

	#----- HELPERS
	def find_collection
		@collection = Collection.find(params[:id])
	end

	private
		def collection_params
			params.require(:collection).permit(:to_name, :to_email, :from_name, :from_email)
		end
	
end