class ShopkeeperSignupForm
  include ActiveModel::Model

  validates :password, length: { minimum: 8 }
  validates :shopname, :userpic, presence: true

  delegate :email, :password, :role, :shopname, :userpic, to: :user

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
                                   :role, :shopname, :userpic)
    end
end
