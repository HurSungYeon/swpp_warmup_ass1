class HomeController < ApplicationController
  def index
  end

  def login
	@username = params[:username]
	@password = params[:password]
	if(@username.length<5 or @username.length>20)
		@errorparam = -1
		#render :json => { "error": -1, "username": @username }
	elsif(@password.length<8 or @password.length>20)
		@errorparam = -2
		#render :json => { "error": -2, "username": @username }
	else
		@errorparam = 0
		#render :json => { "error": 5, "username": @username }
	end

	render :json => { "error": @errorparam, "username": @username }
  end
end
