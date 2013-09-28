class ExploreController < ApplicationController
	def index
		@root = Option.find_by_name("Electrical_Engineering") # was "Symbolic Systems"
		if @loggedIn
			@viewer = @usr
			@visit = false
		else
			@visit = true
		end
		@count=0
	end
end
