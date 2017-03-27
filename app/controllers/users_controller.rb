class UsersController < ApplicationController
	before_action :can_change, only: [:edit,:update]
	before_action :require_no_authentication, only: [:new,:create]

	def new 
		@user = User.new
	end

	def show

		@user = User.find(params[:id])	
		@tweets = Tweet.where("user_id = ?",[@user.id]).last(20)
		@follow = Follow.new

		@followers = Follow.where("follower_id = ?",[@user.id])

		@followees = Follow.where("followee_id = ?",[@user.id])

		if user_signed_in?
			@current = current_user
			#already_following?(@followers)
		end
	end

	def create
		@user = User.new(user_params)

		if @user.save
			@user_session = UserSession.new(session,(params[:user]))
			@user_session.authenticate!
			
			redirect_to @user, notice: 'Cadastro criado com sucesso'
		else
			render action: :new
		end
	end

	def edit
		@user = User.find(params[:id])	
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to @user,
				notice: 'Cadastro atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def already_following?(fwrs)
		fwrs.each do |f|
			if User.find(f.follower_id).id == current_user.id
				return true
			end
		end
		return false
	end
	helper_method :already_following?

	private
		def user_params
			params.
				require(:user).
				permit(:email,:full_name,:location,:password,:password_confirmation,:bio)
		end	

		def can_change
			unless user_signed_in? && current_user == user
				redirect_to user_path(params[:id])
			end
		end

		def user
			@user ||=User.find(params[:id])
		end
end
