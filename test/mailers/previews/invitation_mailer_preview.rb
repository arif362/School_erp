# Preview all emails at http://localhost:3000/rails/mailers/invitation_mailer
class InvitationMailerPreview < ActionMailer::Preview
  def new_invite
    user=User.new(name: "Moshiur Rahman",email: "moshiur.rahman@gmail.com",password:"123123",password_confirmation: "123123")
    InvitationMailer.with(user: user).new_invite
  end
end
