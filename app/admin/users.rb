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

    permit_params :phone_number, :first_name, :last_name, :email, :profile_pic, :is_active, :page_cover, address_attributes: %i[id latitude address longitude], education_detail_attributes: %i[id degree_name stream institute_name start_date end_date percentage cgpa user_id], experience_detail_attributes: %i[id latitude address longitude], education_detail_attributes: %i[id job_title company_name is_current_job start_date end_date user_id]

      

   form do |f|
    f.inputs do
      f.input :email
      f.input :phone_number
      f.input :first_name
      f.input :last_name
      f.input :profile_pic
      f.input :page_cover
      f.input :is_active
      f.inputs "Education Details" do
        f.has_many :education_details do |education_detail|
          education_detail.input :degree_name
          education_detail.input :stream
          education_detail.input :institute_name
          education_detail.input :start_date, as: :date_time_picker, datepicker_options: { min_date: "2013-10-8",        max_date: "+3D" }
          education_detail.input :end_date, as: :date_time_picker, datepicker_options: { min_date: "2013-10-8",        max_date: "+3D" }
          education_detail.input :cgpa
        end
      end
      f.inputs "Experience Details" do
        f.has_many :experience_details do |experience_detail|
          experience_detail.input :job_title
          experience_detail.input :company_name
          experience_detail.input :is_current_job
          experience_detail.input :start_date, as: :date_time_picker, datepicker_options: { min_date: "2013-10-8",        max_date: "+3D" }
          experience_detail.input :end_date, as: :date_time_picker, datepicker_options: { min_date: "2013-10-8",        max_date: "+3D" }

        end
      end
    end
    f.actions
  end
end
