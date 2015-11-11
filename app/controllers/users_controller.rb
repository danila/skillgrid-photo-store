class UsersController < ApplicationController
  before_action :set_user, only: [:update, :edit]
  def new
  	@user = User.new
  end

  def create
    authorize User

    @signup_form = SignupFormFinder.new(params).form
    @user = @signup_form.user
    if @signup_form.submit
      auto_login(@user)
      flash[:success] = 'You were successfully signed up'
  		redirect_to root_url
    else
      render :new
    end
  end

  def update
    authorize @user

    if @user.update_attribute(:role, user_params[:role])
      flash[:success] = 'User was successfully updated'
      redirect_to users_path
    else
      flash[:danger] = 'An error occured during updating,
                          please check your input'
      render :edit
    end
  end

  def edit
    authorize @user
  end

  def index
    authorize User
    @users = policy_scope(User)
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :role, :firstname, :surname,
                                    :userpic, :passport, :birthday, :shopname)
    end
end
