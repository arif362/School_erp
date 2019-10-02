class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#, :confirmable
  has_one :school, dependent: :destroy
  belongs_to :department, optional: true


  USER_ROLE = {
       admin: 'Admin',
       student: 'Student',
       teacher: 'Teacher'
  }.freeze

  def self.get_users(type)
    if type == 'Teacher'
      where(user_type: 'Teacher')
    elsif type == 'Student'
      where(user_type: 'Student')
    end
  end

end
