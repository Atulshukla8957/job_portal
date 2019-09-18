module UserService::API
  module MessageSender

    module_function

    def self.send_code(verification_code)
	    account_sid = Settings.TWILIO_ACCOUNT_SID
	    auth_token  = Settings.TWILIO_AUTH_TOKEN
      begin
        client = Twilio::REST::Client.new(account_sid, auth_token)
        mobile_number = verification_code.mobile_number.length === 10 ? "+44#{verification_code.mobile_number}" : "+#{verification_code.mobile_number}"
        message = client.messages.create(
          from:  Settings.TWILIO_NUMBER,
          to:    mobile_number,
          body:  "Your OTP to #{verification_code.purpose} on Fazremit is #{verification_code.code}"
        )
        verification_code.update_column('twilio_message_sid', message.sid)
      rescue Twilio::REST::TwilioError => e
        raise e
      end
	  end
  end
end