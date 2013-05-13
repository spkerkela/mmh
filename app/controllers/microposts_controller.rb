class MicropostsController < ApplicationController
	
	# Only the correct user should be able to destroy posts
	before_filter :correct_user, only: :destroy

	def index
		
	end

	def create
		@micropost = current_user.microposts.build(params[:micropost])
		if @micropost.save
			flash[:success] = "New post created"
			redirect_to root_url
		else
			@feed_items = []
			flash[:alert] = "Your post was too short or too long"
			redirect_to root_url
		end
	end

	def destroy
		@micropost.destroy
		redirect_to root_url
	end

	private

		# This checks wether the post belongs to the logged in user
		def correct_user
			@micropost = current_user.microposts.find_by_id(params[:id])
			redirect_to root_url if @micropost.nil?
		end
end
