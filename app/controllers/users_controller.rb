class UsersController < ApplicationController
	def index
		@users = User.find(:all)
		@all_courses = Course.find(:all)
		@id = (params[:id]!=nil)
		if (@id)
			@user = User.find(params[:id])
			@name = @user.name
		end
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
