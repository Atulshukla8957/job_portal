module Api
  module V1
    class ClientSerializer < ActiveModel::Serializer
      attributes :id, :name	
    end
  end
end
