class ExploreController < ApplicationController
	def index
		@count=0
		#@root = Option.find_by_name("Symbolic_Systems") # was "Symbolic Systems"
		if @loggedIn
			@viewer = @usr
			@visit = false
		else
			@visit = true
		end

		if (params[:id]==nil)
			@id = false
		else
			@id = true
			@root = Option.find(params[:id])
		end

		@mjr = Req.find_by_name("Major")


	end
end
