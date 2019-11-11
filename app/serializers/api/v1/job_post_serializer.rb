module Api
  module V1
    class UsersSerializer < ActiveModel::Serializer
      attributes :id, :title,:description,:job_type,:location,:zipcode,:salary,:salary_type,:start_at,:expire_at,:active,:company_id,:user_id

    end
  end
end

