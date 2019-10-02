class SchoolsController < ApplicationController
  before_action :set_school, only: %i[show edit update]
  def new
    @school = School.new
  end

  def create
    school = School.prepare_school(school_params, current_user)
    session[:department_id] = current_department.id
    if school.present?
      redirect_to school_path(school.id), notice: 'Welcome! You have created your school successfully.'
    else
      redirect_to root_path, notice: school.errors.full_messages.first
    end
  end

  def show; end

  def edit; end

  def update
    if @school.update_attributes(school_params)
      redirect_to dashboard_home_path
    else
      render 'edit'
    end
  end

  private
  def school_params
    params.require(:school).permit(:name, :email, :address, :contact, :description)
  end

  def set_school
    @school = School.find_by(id: params[:id])
  end

end
