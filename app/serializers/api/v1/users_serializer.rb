module Api
  module V1
    class UsersSerializer < ActiveModel::Serializer
      attributes :id, :email, :first_name, :last_name, :is_active, :profile_pic, :page_cover
    end
  end
end



#<User id: 19, email: "atul.shukla6@gmail.com", phone_number: nil, first_name: nil, last_name: nil, is_active: true, profile_pic: nil, page_cover: nil, password_digest: "$2a$12$aN.9ymgr2toM/19vlano0uoBSLE/4eW9D9C/WumpqRv...", reset_digest: nil, reset_sent_at: nil, created_at: "2019-09-18 10:57:30", updated_at: "2019-09-18 10:57:30", education_detail_id: nil, experience_detail_id: nil, encrypted_password: "", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil> 