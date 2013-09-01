class ExploreController < ApplicationController
	def index
		@root = Option.find_by_name("Symbolic Systems")
		if @loggedIn
			@viewer = @usr
			@visit = false
		else
			@visit = true
		end
	end
end
