class ExploreController < ApplicationController
	def index
		@degree = Option.find_by_name("Degree")
		@major = Req.find_by_name("Major")
		@symsys = Option.find_by_name("Symbolic Systems")
	end

	def major
		@major = Req.find_by_name("Major")
		@symsys = Option.find_by_name("Symbolic Systems")
		@allOptions = Option.find(:all)
	end
end
