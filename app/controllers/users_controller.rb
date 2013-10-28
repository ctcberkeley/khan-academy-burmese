class UsersController < ApplicationController

  def show
    id = params[:id] # retrieve user id
    @user = User.find(id) # look up user by unique ID
  end

  def index
    #redirect to current user? (stored in session?)
    type = params['type']
    current_id = session[:id]
    case type
    when 'Available' then @videos = Video.find(:all)
    when 'Translate' then @videos = Video.find(:all, :translator_id => current_id)
    when 'Digitize' then @videos = Video.find(:all, :translator_id => current_id)
    when 'QA' then @videos = Video.find(:all, :translator_id => current_id)
    when 'Completed' then @videos = Video.find(:all, :translator_id => current_id)
    else redirect_to users_path(:id => current_id, :type => 'Available')
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    name = params['firstName']+" "+params['lastName']
    email = params['email']
    userHash = [:name => name, :email => email]
    @user = User.create!(userHash)
    flash[:notice] = "Your account was successfully created"
    #Redirect to dashboard?
    redirect_to user_path(@user)
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes!(params[:user])
    flash[:notice] = "Your account was successfully updated"
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Your account was successfully deleted"
    redirect_to login_page_path
  end

  def change_password
    @user = User.find(params[:id])
  end

  def update_password
    #Needs more checks once OAuth is in place
    @user = User.find(params[:id])
    current_password = params[:current]
    new_password = params[:new]
    if new_password != params[:confirmation]
      flash[:notice] = "Your confirmation did not match the new password you entered."
      redirect_to change_password_path(@user)
    else
      #Update password
      flash[:notice] = "Your password was updated."
      redirect_to edit_user_path(@user)
    end
  end

end
