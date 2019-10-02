class ApplicationMailer < ActionMailer::Base
  default from: 'moshiur.radif@gmail.com'
  layout 'mailer'

  # def mailing(user)
  #   @user = user
  #   mail(to: @user.email, subject: "Invitation to join")
  # end
end
