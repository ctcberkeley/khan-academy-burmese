class StaticPagesController < ApplicationController
	def index
		redirect_to show_dashboard_path(current_user) if current_user
	end
  def login
  	if current_user
  		redirect_to show_dashboard_path(current_user)
  	else
  		@user = User.new
  	end
  end
end
