class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy invite]
  
  def index
    @user = User.new #for modal
    @users = current_department.users.get_users(params[:user_type])
  end

  def new
    respond_to do |format|
      @user = User.new
      format.js
    end
  end

  def add
    respond_to do |format|
      @user = User.create(user_params)
      format.js
    end
  end

  def destroy
    deleted=@user.destroy
    redirect_to users_path(user_type: deleted.user_type), alert: "#{deleted.user_type} : #{deleted.name} has been deleted!"
  end

  def update
    if @user.update(set_params)
      redirect_to dashboard_home_path, notice: "User updated!"
    end
  end

  def show
    # code here
  end

  def edit
    p params[:id]
    # code here
  end

  def invite
    InvitationMailer.with(user: @user).new_invite.deliver_later
    redirect_to users_path(user_type: params[:user_type]), notice: "Invitation sent!"
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end
  def set_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :user_type, :department_id)
  end
end
