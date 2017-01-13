class HomeController < ApplicationController
	def index
		#gets 10 tweets to show in the main page
		@tweets = Tweet.take(10)
	end
end