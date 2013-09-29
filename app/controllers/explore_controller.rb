class ExploreController < ApplicationController
	def index
		@root = Option.find_by_name("EE") # was "Symbolic Systems"
		if @loggedIn
			@viewer = @usr
			@visit = false
		else
			@visit = true
		end
		@count=0
	end
end
