class HomeController < ApplicationController
skip_before_filter :verify_authenticity_token
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

	if(@errorparam != 0)
		render :json => { "error_code": @errorparam}
	else
		render :json => { "user_name": @username, "login_count": user.count }
	end
  end

  def signup
	@username = params[:username]
        @password = params[:password]
        if(@username.length<5 or @username.length>20)
                @errorparam = -1
        elsif(@password.length<8 or @password.length>20)
                @errorparam = -2
	elsif(User.find_by_username(@username)!=nil)
		@errorparam = -3
        else
                @errorparam = 0
		newuser = User.create(username: @username,password: @password, count: 1)
		newuser.save
        end
	
	if(@errorparam != 0)
        	render :json => { "error_code": @errorparam}
	else
		render :json => { "user_name": @username, "login_count": newuser.count }
	end
  end

  def loggedin
	@username = params[:username]
	user = User.find_by_username(@username)
	@count = user.count
#	render "loggedin"
#	redirect_to action: "main", username: @username
#	@password = params[:password]
  end

  def clearData
	users = User.all
	users.each do |user|
		user.destroy
	end
	redirect_to action: "index"
  end
end
