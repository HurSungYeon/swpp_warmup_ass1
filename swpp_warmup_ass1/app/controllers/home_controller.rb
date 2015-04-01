class HomeController < ApplicationController
  def index
  end

  def login
	@username = params[:username]
	@password = params[:password]

	@errorparam = -1

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
        end

        render :json => { "error": @errorparam, "username": @username }

  end
end
