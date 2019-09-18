module Api
  module V1
    class StatesSerializer < ActiveModel::Serializer
      attributes :id, :name, :short_name, :currency_id, :mobile_number_code
    end  
  end
end