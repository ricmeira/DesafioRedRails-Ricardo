class ApplicationController < ActionController::Base
	delegate :current_user,:user_signed_in?, to: :user_session
	helper_method :current_user,:user_signed_in?
 	protect_from_forgery with: :exception

 	def user_session
 		UserSession.new(session)
 	end

 	def require_authentication 
 		unless user_signed_in?
 			redirect_to new_user_session_path, alert = "Needs login"
 		end
 	end

 	def require_no_authentication
 		if user_signed_in?
 			redirect_to root_path
 		end
 	end
end
