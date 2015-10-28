class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      auto_login(@user)
      flash[:success] = "You have been successfully signed up"
  		redirect_to root_url
  	else
  		render :new
  	end
  end

  private
    def user_params
      params.require(:user).permit(:email, :username, :password,
                                   :password_confirmation)
    end
end
