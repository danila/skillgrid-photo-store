class SignupFormFinder
  attr_reader :params

  def initialize(params = {})
    @params = params
  end

  def form
    case params[:user][:role]
      when "shopkeeper" then ShopkeeperSignupForm.new(params)
      when "guest" then GuestSignupForm.new(params)
      when "admin" then AdminSignupForm.new(params)
    end
  end

end
