class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
    @signup_form = SignupFormFinder.new(params).form
    @user = @signup_form.user
    if @signup_form.submit
      auto_login(@user)
      flash[:success] = "You have been successfully signed up"
  		redirect_to root_url
  	else
  		render :new
  	end
  end


end
