class FollowsController < ApplicationController

	def create
		@user = current_user
		@followee = User.find(params[:followee_id])

		@follow = Follow.create!(follower_id: @user.id, followee_id: @followee.id)

		redirect_to :back

	end

	def destroy
		Follow.destroy(params[:id])

		redirect_to :back
	end

	private
		def followee_params
	    	params.require(:follow)
	    	.permit(:followee_id,:id)
	  	end
end