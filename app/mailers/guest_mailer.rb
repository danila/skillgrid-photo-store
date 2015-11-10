class GuestMailer < ActionMailer::Base
  default from: "purchase@skillgrid-store.com"

  def purchase_email(user, photo)
    @user = user
    @photo = photo
    mail(to: @user.email, subject: 'Thank you for purchasing')
  end
end

