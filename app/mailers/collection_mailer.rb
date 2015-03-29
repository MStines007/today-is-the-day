class CollectionMailer < ApplicationMailer

	def gift_email(collection)
		@collection = collection
		@url = "/collections/#{@collection.id}"
		mail(to: 'testing007testing007@gmail.com', subject: "#{@collection.date}: OUR APP SENT THIS!!!!!")
	end

end


# def gift_email(collection)
# 		@collection = collection
# 		@url = "/collections/#{@collection.id}"
# 		mail(to: params[:to_email], subject: "#{params[:to_name]}, Today Is The Day, and #{params[:from_name]} sent you a gift!")
# 	end
