ActiveAdmin.register Company do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :company_name, :profile_description, :business_name_id, :establishment_date, :company_website_url
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end



  form do |f|
    f.inputs do
      f.input :company_name
      f.input :profile_description
      f.input :business_name_id, as: :select, collection: BusinessName.all , :prompt=> "Select BusinessName"
      f.input :establishment_date, as: :date_time_picker, datepicker_options: { min_date: "2013-10-8",        max_date: "+3D" }
      f.input :company_website_url
    end
    f.actions
  end  

    
end
