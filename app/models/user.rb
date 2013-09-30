class User < ActiveRecord::Base
	attr_accessible :name, :login, :password_digest, :salt, :password_confirmation, :password
	has_and_belongs_to_many :courses
	validates_confirmation_of :password

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
		opt.chunks.each do |ch|
			if !self.completeCh(ch)
				flag = false
			end
		end
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

	# A user has completed a chunk when have have done all of its
	# reqs and sub-chunks
	def completeCh(ch)
		flag = true
		ch.chunks.each do |ch2|
			if !self.completeCh(ch2)
				flag = false
			end
		end
		ch.reqs.each do |r|
			if !self.completeReq(r)
				flag = false
			end
		end
		return flag
	end

	def password
		@temp
	end

	def password=(pword)
		@temp=pword
	end

	def password_valid?(pword2)
		@temp=pword2 + salt # not sure if temp could be tomp
		@full = Digest::SHA1.hexdigest(@temp)
		return @full==password_digest
	end
end