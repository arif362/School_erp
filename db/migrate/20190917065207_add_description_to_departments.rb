class AddDescriptionToDepartments < ActiveRecord::Migration[6.0]
  def change
    add_column :departments, :description, :string, default: "No description provided"
  end
end
