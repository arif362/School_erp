class InvitationMailer < ApplicationMailer
  def new_invite
    @user=params[:user]
    @url="http://localhost:3000/users/#{@user.id}/edit"
    mail(to: @user.email, subject: "Invitation to join")
  end


end
