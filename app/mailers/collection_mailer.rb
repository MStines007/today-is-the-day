class CollectionMailer < ApplicationMailer

	def gift_email(collection)
		@collection = collection
		mail(	to: "#{@collection.to_email}", 
					cc: "#{@collection.from_email}", 
					reply_to: "#{@collection.from_email}",  
					subject: "#{@collection.from_name} says #{@collection.date.to_formatted_s(:long_ordinal)[/[^,]+/]} is YOUR day!")
	end

end


# def gift_email(collection)
# 		@collection = collection
# 		@url = "/collections/#{@collection.id}"
# 		mail(to: params[:to_email], subject: "#{params[:to_name]}, Today Is The Day, and #{params[:from_name]} sent you a gift!")
# 	end
