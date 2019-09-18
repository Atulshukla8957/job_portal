module Api
  module V1
    class BanksSerializer < ActiveModel::Serializer
      attributes :id, :name, :country_id, :code, :country_bank_id, :country_bank_type, :deposit, :created_at, :updated_at, :currency, :payout_bank_id 
    end
  end
end



