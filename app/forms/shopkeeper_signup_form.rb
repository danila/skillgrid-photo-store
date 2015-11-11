class ShopkeeperSignupForm < SignupForm

  validates :password, length: { minimum: 8 }
  validates :shopname, :userpic, :role, presence: true

  delegate :email, :password, :role, :shopname, :userpic, to: :user

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation,
                                   :role, :shopname, :userpic)
    end
end
