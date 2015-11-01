class AdminSignupForm
  include ActiveModel::Model

  validates :password, length: { minimum: 10 }
  validates :firstname, :surname, :userpic, :passport, :birthday, presence: true

  delegate :email, :password, :role, :firstname, :surname, :userpic, :passport, :birthday, to: :user

  attr_reader :params
  attr_accessor :user

  def initialize(params = {})
    @params = params
    @user = User.new(user_params)
  end

  def submit
    if valid? && @user.save
      @user
    else
      false
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation,
                                   :role, :firstname, :surname, :userpic,
                                   :passport, :birthday)
    end
end
