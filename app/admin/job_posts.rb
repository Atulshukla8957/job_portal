ActiveAdmin.register JobPost do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title,:description,:job_type,:location,:zipcode,:salary,:salary_type,:start_at,:expire_at,:active,:company_id,:user_id

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
      f.input :company_id
      f.input :title
      f.input :description
      f.input :job_type , as: :select, collection: JobPost.job_types.keys, include_blank: false
      f.input :location
      f.input :zipcode
      f.input :salary
      f.input :salary_type, as: :select, collection: JobPost.salary_types.keys, include_blank: false
      f.input :start_at
      f.input :expire_at
      f.input :active
    end
    f.actions
  end
end
