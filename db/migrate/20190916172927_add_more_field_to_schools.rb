class AddMoreFieldToSchools < ActiveRecord::Migration[6.0]
  def change
    add_column :schools, :email, :string
    add_column :schools, :description, :text
    add_column :schools, :address, :string
    add_column :schools, :contact, :string
  end
end
