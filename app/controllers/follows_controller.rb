class FollowsController < ApplicationController

	def create
		@user = current_user
		@followee = User.find(params[:followee_id])

		@follow = Follow.create!(follower_id: @user.id, followee_id: @followee.id)

		redirect_to @user, notice: 'User is now being followed'

	end

	def destroy
		Follow.destroy(params[:id])
	end

	private
		def followee_params
	    	params.require(:follow)
	    	.permit(:followee_id,:id)
	  	end
end