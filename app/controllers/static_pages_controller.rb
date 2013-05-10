class StaticPagesController < ApplicationController

	skip_before_filter :require_login, only: [:home, :help]
	def home
		if logged_in?
			@micropost = current_user.microposts.build
			@feed = current_user.feed
		end
	end

	def help
		
	end
end
