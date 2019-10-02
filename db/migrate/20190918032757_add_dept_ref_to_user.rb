class AddDeptRefToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :departments, :user, foreign_key: true
  end
end
