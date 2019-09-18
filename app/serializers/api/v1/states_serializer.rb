module Api
  module V1
    class StatesSerializer < ActiveModel::Serializer
      attributes :id, :name, :code, :country_id, :sw_verified
      belongs_to :country
    end  
  end
end