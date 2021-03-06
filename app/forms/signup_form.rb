class SignupForm
  include ActiveModel::Model

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
      raise NotImplementedError
    end
end
