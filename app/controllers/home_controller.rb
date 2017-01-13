class HomeController < ApplicationController
	def index
		#gets 10 tweets to show in the main page
		if user_signed_in?
			@user = current_user
		end
		@tweet = Tweet.new
		@tweets = Tweet.last(20).reverse
	end
end