class GuestMailer < ActionMailer::Base
  default from: "purchase@skillgrid-store.com",
          template_path: "mailers/guest_mailer"


  def purchase_email(user, photo)
    @user = user
    @photo = photo
    mail(to: @user.email, subject: 'Thank you for purchasing')
  end
end

