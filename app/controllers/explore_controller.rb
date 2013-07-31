class ExploreController < ApplicationController
	def index
		@root = Option.find_by_name("Symbolic Systems")
	end

	def major
		@major = Req.find_by_name("Major")
		@symsys = Option.find_by_name("Symbolic Systems")
		@allOptions = Option.find(:all)
	end
end
