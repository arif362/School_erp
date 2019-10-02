# == Schema Information
#
# Table name: schools
#
#  id          :integer          not null, primary key
#  address     :string
#  contact     :string
#  description :text
#  email       :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class School < ApplicationRecord
  has_many :departments, dependent: :destroy
  belongs_to :user

  def self.prepare_school(school_params, current_user)
    school = create!(school_params.merge(user_id: current_user.id))
    if school.present?
      department = school.departments.create(name: 'Administration')
      current_user.update_attributes(user_type: User::USER_ROLE[:admin],
                                     department_id: department.id)
    end
    school
  end





end
