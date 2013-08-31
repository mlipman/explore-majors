class UsersController < ApplicationController
	def index
		@users = User.find(:all)
		@all_courses = Course.find(:all)
		@id = (params[:id]!=nil)
		if (@id)
			@user = User.find(params[:id])
			@name = @user.name
		end
		if (params[:search]!=nil)
			searchQry = params[:search].upcase
			@searchResults = Course.search(searchQry)
		else
			@searchResults = []
		end
		logger.debug "passing in #{searchQry}"
		if (@loggedIn)
			@completed_reqs = Array.new
			@todo_reqs = Array.new
			Req.find(:all).each do |req|
				if @usr.completeReq(req)
					@completed_reqs << req
				else
					@todo_reqs << req
				end
			end
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

	def login
		@user = User.new
	end

	def post_login
		if User.exists?(:login=>params[:user][:login])
			@usr = User.find_by_login(params[:user][:login])
			session[:currLogin] = params[:user][:login]
			@loggedIn=true # needed?
			redirect_to :action=>:index, :id=>@usr.id
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


end
