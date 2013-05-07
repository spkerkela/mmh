class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash.now[:success] = "Account created"
			redirect_to users_path
		else
			flash.now[:alert] = "There are some issues with your form"
			render :new
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User deleted"
		redirect_to users_url
	end

	def update
		if @user.update_attributes(params[:user])
			flash[:success] = "Profile updated"
			redirect_to @user
		else

		end
	end

	def index
		@users = User.all
	end


end
