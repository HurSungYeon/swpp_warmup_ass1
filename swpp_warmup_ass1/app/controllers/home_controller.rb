class HomeController < ApplicationController
  def index
  end

  def trylogin
	@username = params[:identity]
	@password = params[:password]
	render :json => { "error": -1, "username": @username }
  end
end
