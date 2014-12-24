class SessionsController < ApplicationController
  def create
    session[:username] = params[:username]
    session[:password] = params[:password]
    if session[:username] == ENV['USERNAME'] && session[:password] == ENV['PASSWORD']
      flash[:notice] = "Successfully logged in."
      redirect_to "/" and return
    else
      flash[:error] = "Please check your credentials."
      redirect_to :back and return
    end
  end

  def destroy
    reset_session
    flash[:notice] = "Successfully logged out."
    redirect_to login_path
  end
end