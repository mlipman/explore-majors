class UsersController < ApplicationController
	def index
		@users = User.find(:all)
		@courses = Course.find(:all)

	end 

end
