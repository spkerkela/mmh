class StaticPagesController < ApplicationController

	skip_before_filter :require_login, only: [:home, :help]
	def home
		
	end

	def help
		
	end
end
