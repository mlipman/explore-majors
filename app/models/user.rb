class User < ActiveRecord::Base
	attr_accessible :name, :login
	has_and_belongs_to_many :courses

	# If a user has completed any of the options for a req
	# then that user has completed the requirement
	def completeReq(req)
		flag = false
		req.options.each do |opt|
			if self.completeOpt(opt)
				flag = true
			end
		end
		return flag
	end

	# If a user has completed all the reqs and has all of the required
	# courses, then they have completed that option
	# Note: most options will have either reqs or courses, but often not both
	def completeOpt(opt)
		flag = true
		opt.reqs.each do |req|
			if !self.completeReq(req)
				flag = false
			end
		end
		opt.courses.each do |course|
			if !self.courses.exists?(course.id)
				flag = false
			end
		end
		return flag
	end

end