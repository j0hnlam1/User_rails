class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by email: params[:email]
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to user
			# redirect_to "/users/#{user.id}"

		else
			flash[:errors] = ["Invalid combination"]
			redirect_to new_session_path
			# redirect_to "/session/new"
		end
	end 

	def destroy
		session[:user_id] = nil
		redirect_to new_session_path
		# redirect_to '/sessions/new'
	end

end
