class DepartmentsController < ApplicationController

  def new
    @department = Department.new
  end

  def index
    @department = Department.new
    @departments = current_user_departments
  end

  def show
    @department = Department.find_by(id: params[:id])
  end

  def create
    @department = Department.new(dept_params)
    if @department.save
      session[:department_id] = @department.id
      redirect_to departments_path
    else
      render 'new'
    end
  end

  def edit
    @department = Department.find_by(id: params[:id])
  end

  def update
    @department = Department.find_by(id: params[:id])
    if @department.update_attributes(dept_params)
      redirect_to departments_path
    else
      render 'edit'
    end
  end

  def destroy
    Department.find_by(id: params[:id]).destroy
    redirect_to departments_path

  end

  def switch
    @department = Department.find(params[:id])
    session[:department_id] = @department.id if @department.present?
    redirect_to department_path(@department.id)
  end
  private
    def dept_params
      params.require(:department).permit(:name, :description).merge(:school => current_school)
    end
end
