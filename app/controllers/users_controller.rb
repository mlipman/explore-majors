class UsersController < ApplicationController
	def index
		# no id param, just show the logged in user
		# if not logged in, redirect to login pad with notice
		if (@loggedIn)
			if (params[:search]!=nil)
				searchQry = params[:search].upcase
				@searchResults = Course.search(searchQry)
			else
				@searchResults = []
			end
			#logger.debug "passing in #{searchQry}"
			@completed_reqs = Array.new
			@todo_reqs = Array.new
			Req.find(:all).each do |req|
				if @usr.completeReq(req)
					@completed_reqs << req
				else
					@todo_reqs << req
				end
			end
		else
			flash[:notice] = "Please log in to view and manage your classes"
			#logger.debug "not logged in, redirecting"
			redirect_to :action=>:login
		end
	end 

	def ajaxHandler
		logger.debug "in ajaxHandler"
		courses = []
		searchQry = params[:qry].upcase
		if searchQry==''
			render(:partial => "none")
			return
		end
		# ITS GETTING WORSE!!!!!!!!!!!!!!!!>
		# ERROR ON MATH, S, OTHERS, SEE JS CODE
		courses = Course.search(searchQry)

		if (courses==[])
			render(:partial => "fail")
		else
			
			render(partial: "course", collection: courses, as: :course)
			#render(courses)		

		end
		#loluwish:
		# rails magically renders partial course (_course.html.erb), for each course in courses, accessible in the partial as @course
	end

	def add_drop_button
		cn = params[:course_name2]
		words = cn.split
		# add in error checking for if isn't set or smthng
		course = Course.where("deptCode = ? AND deptNum = ?", words[0], words[1]).first

		#logger.debug(course.id)
		if (@usr.courses.exists?(course.id))
			@usr.courses.delete(course)
		else
			@usr.courses << course
		end
		render nothing: true
	end 



	def login
		if @loggedIn then redirect_to :action=>:index end
		@user = User.new
	end

	def post_login
		if User.exists?(:login=>params[:user][:login])
			@usr = User.find_by_login(params[:user][:login])
			if @usr.password_valid?(params[:user][:password])
				session[:currLogin] = params[:user][:login]
				@loggedIn=true
				redirect_to :action=>:index
			else
				flash[:notice] = "Invalid password"
				redirect_to :action=>:login
			end
		else
			flash[:notice] = "Invalid login"
			redirect_to :action=>:login
		end
	end

	def logout
		reset_session
		@loggedIn = false
		flash[:notice] = "You have been logged out"
		redirect_to :action=>:login
	end

	#add create and new
	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.valid? then
			@num = Random.rand.to_s
			@user.salt = @num
			@temp = @user.password + @num
			@user.password_digest=Digest::SHA1.hexdigest(@temp)
			@user.save
			session[:currLogin] = params[:user][:login]
			redirect_to :action => :login
		else
			render :action => :new
		end
	end


end
