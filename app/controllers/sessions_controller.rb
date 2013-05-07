class SessionsController < ApplicationController

	skip_before_filter :require_login, only: [:new, :create]

	def new
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to user
			flash.now[:success] = "Logged in"
		else
			render :new
			flash.now[:error] = "Wrong Credentials"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path, notice: "You have logged out"
	end

end
