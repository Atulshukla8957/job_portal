module Api
  module V1
    class OccupationsSerializer < ActiveModel::Serializer
      attributes :id, :name, :code, :created_at, :updated_at
    end
  end
end