class UserSessionsController < ApplicationController
	def new 
		@user_session = UserSession.new(session)
	end

	def create
		@user_session = UserSession.new(session,params[:user_session])

		if @user_session.authenticate!
			redirect_to root_path,notice: 'Log in Succesful'
		else
			render action: :new
		end
	end

	def destroy
	end
end