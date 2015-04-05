class HomeController < ApplicationController
  def first
	redirect_to action: "index"
  end

  def data
	@data = User.all
  end

  def index
  end

  def login
	@username = params[:username]
	@password = params[:password]

	@errorparam = 0

	user = User.find_by_username(@username)
	if(user == nil)
		@errorparam = -4
	elsif(user.password != @password)
		@errorparam = -4
	else
		user.count = user.count + 1
		user.save
	end

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
		
		newuser = User.create(username: @username,password: @password, count: 0)
		newuser.save
        end

        render :json => { "error": @errorparam, "username": @username }

  end

  def loggedin
	@username = params[:username]
	user = User.find_by_username(@username)
	@count = user.count
#	render "loggedin"
#	redirect_to action: "main", username: @username
#	@password = params[:password]
  end

  def main
#	@username = params[:username]
  end
end
