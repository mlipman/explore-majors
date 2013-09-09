class Course < ActiveRecord::Base
	attr_accessible :dept, :num, :title, :desc, :minUnits, :maxUnits
	has_and_belongs_to_many :users
	has_and_belongs_to_many :options





	def self.search(qry)
		matchedCourses = []
		var = "one"
		logger.debug("nubmer: #{var}")
		logger.debug("qry is" + qry)
		Course.find(:all).each do |candidate|
			# rightnow just string matching on "dept"
			# after explore courses scrape, add fancier searching
			if candidate.dept.upcase.include?(qry) && !matchedCourses.include?(candidate)
				matchedCourses << candidate
			end
		end
		return matchedCourses
	end

	def status(viewre)
		if viewre.courses.exists?(self.id) then
			return "completed"
		else 
			return "todo" 
		end
	end

	def name
		return dept
	end

end