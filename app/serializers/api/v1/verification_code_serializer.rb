module Api
  module V1
    class VerificationCodeSerializer < ActiveModel::Serializer
      attributes :id , :mobile_number, :code, :status, :twilio_error_message, :purpose, :twilio_error_code, :twilio_message_sid
    end
  end
end