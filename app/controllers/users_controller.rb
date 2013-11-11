class UsersController < ApplicationController
  before_filter :require_user, :except => [:new, :create, :login]
  def show
    id = params[:id] # retrieve user id
    @user = User.find(id) # look up user by unique ID
  end

  def index
=begin
    #redirect to current user? (stored in session?)
    type = params['type']
    current_id = session[:id]
    if current_id.nil?
      redirect_to login_page_path
    else
      redirect_to show_dashboard_path
    end
=end
  end

  def new
    # default: render 'new' template
  end

  def create
    name = params['firstName']+" "+params['lastName']
    email = params['email']
    password = params['password']
    @user = User.new(:name => name, :email => email, :password => password)
    if @user.save
      flash[:success] = "Your account was successfully created"
#      redirect_to show_dashboard_path(@user)
      login
    else
      flash[:error] = "Problem creating account. Please try again."
      redirect_to login_page_path
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes!(params[:user])
    flash[:success] = "Your account was successfully updated"
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "Your account was successfully deleted"
    redirect_to login_page_path
  end

=begin
  def change_password
    @user = User.find(params[:id])
  end

  def update_password
    #Needs more checks once OAuth is in place
    @user = User.find(params[:id])
    current_password = params[:current]
    new_password = params[:new]
    if current_password != @user.password
      flash[:notice] = "Incorrect current password"
      redirect_to change_password_path(@user)
    elsif new_password != params[:confirmation]
      flash[:notice] = "Your confirmation did not match the new password you entered."
      redirect_to change_password_path(@user)
    else
      @user.password = new_password
      @user.save
      flash[:notice] = "Your password was updated."
      redirect_to edit_user_path(@user)
    end
  end
=end
  def login
    @user = User.find_by_email(params[:email])
    if @user.nil? or @user.password != params[:password]
      flash[:notice] = "Login credentials are incorrect. Please try again."
      redirect_to login_page_path
    else
      session[:id] = @user.id
      redirect_to show_dashboard_path(@user)
    end
  end

  def dashboard
    if session[:id].nil?
      redirect_to login_page_path
    end
    @user = User.find(session[:id])
  end

end
