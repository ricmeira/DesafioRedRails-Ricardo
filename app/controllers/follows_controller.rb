class FollowsController < ApplicationController

	def create
		@follow = Follow.new()
	end
end