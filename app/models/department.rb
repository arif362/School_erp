class Department < ApplicationRecord
  belongs_to :school
  has_many :users, dependent: :destroy
  after_create :check_description

  def check_description
    if self.description==""
      self.description="No description provided"
      self.save
    end
  end

  def self.students(dept_id)
    department=Department.find_by(id: dept_id)
    if department
      department.users.where(user_type: User::USER_ROLE[:student])
    else
      nil
    end
  end

  def self.teachers(dept_id)
    department=Department.find_by(id: dept_id)
    if department
      department.users.where(user_type: User::USER_ROLE[:teacher])
    else
      nil
    end
  end

  # after_find :set_department
  # after_create :set_department
  #
  # private
  #   def set_department
  #     session[:department_id]=self.id
  #   end
end
