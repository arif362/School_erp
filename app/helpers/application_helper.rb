module ApplicationHelper

  def current_school
    # p current_user.school
    current_user.school
  end

  def current_user_departments
    current_school.departments
  end

  def current_department
    department_id = 0
    if session[:department_id].present?
      department_id = session[:department_id]
    elsif current_user.present? and current_user.department_id.present?
      department_id = current_user.department_id
    end
    @cur_department = Department.find_by_id(department_id)
  end


    # def current_school_students
  #   students= current_department.users do |user|
  #     user if user.user_type == 'student'
  #   end
  # end
end
