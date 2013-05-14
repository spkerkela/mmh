module SessionsHelper
	def logged_in?
		!current_user.nil?
	end

	def current_user? user
		user.id == current_user.id
	end
end
