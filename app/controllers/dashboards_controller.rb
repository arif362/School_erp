class DashboardsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :check_user, :authenticate_user!
  def home
    @school=current_school
  end

  private
  def check_user
    if current_user
      if session[:department_id] && current_user.department.nil?
        current_user.update_attributes(department_id: session[:department_id])
      end
      render 'home'
    else
      redirect_to new_user_session_path
    end
  end
end
