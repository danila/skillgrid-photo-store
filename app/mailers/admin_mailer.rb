class AdminMailer < ActionMailer::Base
  default to: Proc.new { User.where(role: :admin).pluck(:email) },
          from: "notification@skillgrid-store.com",
          template_path: "mailers/admin_mailer"

  def new_purchase(user, purchase)
    @user = user
    @purchase = purchase
    mail(subject: "New product purchase by #{@user.email}")
  end

  def purchase_error(user)
    @user = user
    mail(subject: "Purchase error")
  end
end

