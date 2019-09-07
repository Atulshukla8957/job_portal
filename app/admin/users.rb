ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

    permit_params :phone_number, :first_name, :last_name, :email, :profile_pic, :is_active, :page_cover, address_attributes: %i[id latitude address longitude]

   
   form do |f|
    f.inputs do
      f.input :email
      f.input :phone_number
      f.input :first_name
      f.input :last_name
      f.input :profile_pic
      f.input :page_cover
      f.input :is_active
    end
    f.actions
  end
end
