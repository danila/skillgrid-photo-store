class GuestSignupForm < SignupForm

  validates :password, length: { minimum: 6 }

  delegate :email, :password, :role, to: :user

  private
    def user_params
      params.require(:user).permit(:email, :password,
                                   :password_confirmation, :role)
    end
end
