class HomeController < ApplicationController
  def first
	redirect_to action: "index"
  end

  def index
  end

  def login
	@username = params[:username]
	@password = params[:password]

	@errorparam = 0

	render :json => { "error": @errorparam, "username": @username }
  end

  def signup
	@username = params[:username]
        @password = params[:password]
        if(@username.length<5 or @username.length>20)
                @errorparam = -1
        elsif(@password.length<8 or @password.length>20)
                @errorparam = -2
        else
                @errorparam = 0
		#redirect_to action: "home/loggedin", json: { username: @username, password: @password }
		#render :js => "window.location = 'home/loggedin'"
		#return
        end

        render :json => { "error": @errorparam, "username": @username }

  end

  def loggedin
	puts @username
	@username = params[:username]
	puts @username
	@fuck = "FUCK THIS ERROR"
	@fuck = @username
	
#	render "loggedin"
#	redirect_to action: "main", username: @username
#	@password = params[:password]
  end

  def main
#	@username = params[:username]
  end
end
