class HomeController < ApplicationController
  def index
    # @users = User.all
    if user_signed_in?
    	@user = current_user
    end	
  end

 
end
