class CollectionMailer < ApplicationMailer

	default from: 'skylar.panuska@gmail.com'

	def gift_email
		# @collection = collection
		mail(to: 'testing007testing007@gmail.com', subject: 'OUR APP SENT THIS!!!!!')
	end

# TODO: Refactor gift_email to read from db
	# def gift_email(collection)
	# 	@collection = collection
	# 	mail(to: @collection.rec_email, subject: 'Happy Birthday from #{@collection.giver_name}')
	# end

end
