ActiveAdmin.register School do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :email, :description, :address, :contact, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :description, :address, :contact, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # index as: :grid do |school|
  #   link_to admin_schools_path(school)
  # end
end
