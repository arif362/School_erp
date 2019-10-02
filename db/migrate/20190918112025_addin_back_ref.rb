class AddinBackRef < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :dept_id, :department_id
  end
end
