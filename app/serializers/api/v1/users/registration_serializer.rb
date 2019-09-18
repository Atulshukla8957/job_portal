module Api
  module V1
    module Users
      class RegistrationSerializer < ActiveModel::Serializer
        attributes :id, :email, :password_digest, :auth_token
      end
    end
  end
end
