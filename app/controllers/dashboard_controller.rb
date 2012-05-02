class DashboardController < ApplicationController
  def index
  	if user_signed_in?
    	@user = current_user
    end	
  end
end
