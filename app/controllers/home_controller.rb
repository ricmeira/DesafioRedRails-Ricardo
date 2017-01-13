class HomeController < ApplicationController
	def index
		#gets 10 tweets to show in the main page
		if user_signed_in?
			@user = current_user
		end
		@tweet = Tweet.new
		@tweets = Tweet.take(10)
	end
end