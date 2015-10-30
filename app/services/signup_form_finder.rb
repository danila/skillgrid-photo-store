class SignupFormFinder
  attr_reader :params

  def initialize(params = {})
    @params = params
  end

  def form
    return GuestSignupForm.new(params)
    case params[:type]
      when "guest" then GuestSignupForm.new(params)
      when "admin" then AdminSignupForm.new(params)
    end
  end

end
