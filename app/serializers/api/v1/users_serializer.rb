module Api
  module V1
    class UsersSerializer < ActiveModel::Serializer
      attributes :email, :first_name, :last_name
    end
  end
end
