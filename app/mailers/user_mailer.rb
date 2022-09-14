class UserMailer < ApplicationMailer
  default from: 'stocktrading@email.com'

  def status_email
    @user = params[:user]
    email = @user.confirmed? ? @user.email : @user.unconfirmed_email

    mail(to: email, subject: "Your stock trading account has been #{@user.status}")
  end
end
