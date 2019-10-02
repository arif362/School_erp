class RemoveUserColumnFromDepartment < ActiveRecord::Migration[6.0]
  def change
    remove_column :departments, :user_id
  end
end
