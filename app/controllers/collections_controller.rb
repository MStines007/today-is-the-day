class CollectionsController < ApplicationController

	def new
		@collection = Collection.new()
		render :new
	end

	def create
		@collection = Collection.create(:date => params[:collection][:date])
		redirect_to collections_path(@collection.id)
	end

	def show
		@collection = Collection.find(:date)
	end

end