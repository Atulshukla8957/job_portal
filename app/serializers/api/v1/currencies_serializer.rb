module Api
  module V1
    class CurrenciesSerializer < ActiveModel::Serializer
      attributes :id, :name, :code
    end
  end
end