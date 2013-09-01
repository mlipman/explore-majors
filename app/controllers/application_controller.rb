class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :setStuff
  def setStuff
    if session[:currLogin]==nil then
      @loggedIn = false
  	elsif User.exists?(:login=>session[:currLogin]) then
  		@loggedIn = true
      @usr = User.find_by_login(session[:currLogin])
  	else
      @loggedIn = "login error"
  	end
  end
end
