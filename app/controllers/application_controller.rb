class ApplicationController < ActionController::Base
  protect_from_forgery
  def require_user
    if session[:id].nil?
      flash[:notice] = "You have to be logged in to view that page"
      redirect_to login_page_path
      return
    end

    self.current_user = User.find(session[:id])
    if params[:id] != "#{session[:id]}" and not current_user.admin?
      render :status => :forbidden, :text => "You do not have permission to access that page"
      return
    end
  end

  def current_user
    @current_user ||= session[:id] && User.find_by_id(session[:id]) # Use find_by_id to get nil instead of an error if user doesn't exist
  end
  helper_method :current_user #make this method available in views

  def current_user=(user)
    @current_user = user
  end
end
