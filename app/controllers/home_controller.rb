class HomeController < ApplicationController
	def index

		if user_signed_in?
			@user = current_user
		end
		
		@tweet = Tweet.new
		@tweets = Tweet.order('created_at DESC').page(params[:page]).per(10)
		#@tweets = Tweet.last(20).reverse
	end
end