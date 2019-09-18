module Api
  module V1
	  class BeneficiariesSerializer < ActiveModel::Serializer
	    attributes :id, :email, :mobile_number, :first_name, :last_name, :nick_name, :country, :bank_account_type, :bank_name, :bank_account_number,:branch_name, :branch_id, :branch_name, :bank_account_number, :created_at, :updated_at, :currency, :city, :zipcode, :aasm_state, :response_message, :gateway_message, :transaction_type
	  	belongs_to :user, serializer: UsersSerializer
	  end
  end
end