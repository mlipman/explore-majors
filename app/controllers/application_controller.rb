class ApplicationController < ActionController::Base
  protect_from_forgery
  def setStuff
    if session[:currLogin]==nil then
      @loggedIn = false
  	elsif User.exists?(:login=>session[:currLogin]) then
  		@loggedIn = true
  	    @usr = User.find_by_login(session[:currLogin])
  	end

  end

end
