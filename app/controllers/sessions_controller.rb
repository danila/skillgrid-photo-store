class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:username], params[:password], params[:remember_me])
    if user
      flash[:success] = "You have been successfully logged in"
      redirect_back_or_to root_url
    else
      flash[:danger] = "Username or password was invalid"
      render :new
    end
  end


  def destroy
    logout
    flash[:success] = "You have been successfully logged out"
    redirect_to root_url
  end
end
