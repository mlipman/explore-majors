class CoursesController < ApplicationController
	def new
		if !@loggedIn
			flash[:notice] = "You must log in to view/edit classes, try 'demo'"
			redirect_to :controller=>:users, :action=>:login
		end
		@all_courses = Course.find(:all) # move to setStuff
	end

	def add
		id = params[:courseID]
		if (Course.exists?(id))
			course = Course.find(id)
			@usr.courses << course
			@usr.save
			flash[:notice] = "added: " + course.inspect + " and " + @usr.course_ids.to_s
		else
			flash[:notice] = "Couldn't find course with id: " + id
		end
		redirect_to :action=>:new
	end
end
