module Api
  module V1
    class TransactionsSerializer < ActiveModel::Serializer
      attributes :id, :amount, :aasm_state, :user_id, :agent_code, :agent_location_code, :agent_operator, :payment_type, :sending_currency, :sending_country, :payer_location_code, :payout_country, :payout_currency, :payer_code, :delivery_method, :ref_no, :fixed_fee, :sender_last_name, :sender_first_name, :sender_address, :sender_city, :sender_country, :sender_email, :sender_type, :beneficiary_first_name, :beneficiary_last_name, :beneficiary_address, :beneficiary_city, :beneficiary_country, :beneficiary_email, :beneficiary_type, :bank_account_type, :bank_id, :bank_branch_id, :bank_branch_name, :bank_branch_code, :bank_account_number, :mtn_number, :gateway_message, :response_message, :beneficiary_id, :beneficiary_phone_number, :beneficiary_phone_country, :bank_name, :sender_client_id, :beneficiary_client_id, :conversion_rate, :calculated_amount, :sender_state, :sender_zip, :sender_country_of_birth, :sender_date_of_birth, :sender_mobile_number, :sender_occupation_id, :sender_mobile_phone_country, :sender_street_name, :access_token, :payment_url, :sender_original_id, :beneficiary_original_id, :payout_id, :payout_ref_code, :rule_ids, :beneficiary_nick_name, :paid_amount, :purpose, :client_relation, :source_of_funds, :net_payable_amount, :order_code, :client_id
    end
  end
end




