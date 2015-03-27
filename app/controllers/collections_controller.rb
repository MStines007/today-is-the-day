class CollectionsController < ApplicationController

	def new
		@collection = Collection.new
		render :new
	end

	def create
		@collection = Collection.create(:date => params[:collection][:date])
		@collection.wiki_items.build(:date => params[:collection][:date])
		@collection.save
		redirect_to collection_path(@collection.id)
	end

	def show
		@collection = Collection.find(params[:id])
	end
	
end

