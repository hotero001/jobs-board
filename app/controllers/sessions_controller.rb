class SessionsController < ApplicationController
  def new

  end

  def create
  	user = User.where(name: params[:name]).first
  	validate = User.where(password_digest: params[:password_digest]).first
  	if user && validate 
    #the method below is what was attempted on LaunchSchool
  	#user.authenticate(params[:password])
  	  session[:user_id] = user.id
  	  flash[:notice] = "Welcome you are logged in"
  	  redirect_to '/'
  	  flash[:notice] = "Welcome you are logged in"
  	else
  	  flash[:error] = "There is something wrong with your username or password"
  	  redirect_to '/'
  	end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have logged out"
    redirect_to '/'
  end
end
