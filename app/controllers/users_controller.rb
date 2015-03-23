class UsersController < ApplicationController

	def new
		@user = User.new
		render :form
	end

	def create
		@user = User.create(:name => params[:user][:name])

#TODO: Improve logic so the flash will show up. 
		# if @user.save
		# 	flash[:success] = "Hello #{@user.name}!"
		# 	redirect_to '/confirmation'
		# else
		# 	flash[:error] = "Please enter your name to continue."
		# end
	end

	def show
		@user = User.find_by_name(params[:name])

	end

	# private
	# 	def user_params
	# 		params.require(:name)
	# 	end

end
