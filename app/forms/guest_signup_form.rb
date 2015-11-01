class GuestSignupForm
  include ActiveModel::Model

  validates :password, length: { minimum: 6 }

  delegate :email, :password, to: :user

  attr_reader :params
  attr_accessor :user

  def initialize(params = {})
    @params = params
    @user = User.new(user_params)
  end

  def submit
    if @user.save
      @user
    else
      false
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
